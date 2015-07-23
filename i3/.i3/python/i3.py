#======================================================================
# i3 (Python module for communicating with i3 window manager)
# Copyright (C) 2012  Jure Ziberna
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#======================================================================


import sys
import subprocess
import json
import socket
import struct
import threading
import time

ModuleType = type(sys)


__author__ = 'Jure Ziberna'
__version__ = '0.6.5'
__date__ = '2012-06-20'
__license__ = 'GNU GPL 3'


MSG_TYPES = [
    'command',
    'get_workspaces',
    'subscribe',
    'get_outputs',
    'get_tree',
    'get_marks',
    'get_bar_config',
]

EVENT_TYPES = [
    'workspace',
    'output',
]


class i3Exception(Exception):
    pass

class MessageTypeError(i3Exception):
    """
    Raised when message type isn't available. See i3.MSG_TYPES.
    """
    def __init__(self, type):
        msg = "Message type '%s' isn't available" % type
        super(MessageTypeError, self).__init__(msg)

class EventTypeError(i3Exception):
    """
    Raised when even type isn't available. See i3.EVENT_TYPES.
    """
    def __init__(self, type):
        msg = "Event type '%s' isn't available" % type
        super(EventTypeError, self).__init__(msg)

class MessageError(i3Exception):
    """
    Raised when a message to i3 is unsuccessful.
    That is, when it contains 'success': false in its JSON formatted response.
    """
    pass

class ConnectionError(i3Exception):
    """
    Raised when a socket couldn't connect to the window manager.
    """
    def __init__(self, socket_path):
        msg = "Could not connect to socket at '%s'" % socket_path
        super(ConnectionError, self).__init__(msg)


def parse_msg_type(msg_type):
    """
    Returns an i3-ipc code of the message type. Raises an exception if
    the given message type isn't available.
    """
    try:
        index = int(msg_type)
    except ValueError:
        index = -1
    if index >= 0 and index < len(MSG_TYPES):
        return index
    msg_type = str(msg_type).lower()
    if msg_type in MSG_TYPES:
        return MSG_TYPES.index(msg_type)
    else:
        raise MessageTypeError(msg_type)

def parse_event_type(event_type):
    """
    Returns an i3-ipc string of the event_type. Raises an exception if
    the given event type isn't available.
    """
    try:
        index = int(event_type)
    except ValueError:
        index = -1
    if index >= 0 and index < len(EVENT_TYPES):
        return EVENT_TYPES[index]
    event_type = str(event_type).lower()
    if event_type in EVENT_TYPES:
        return event_type
    else:
        raise EventTypeError(event_type)


class Socket(object):
    """
    Socket for communicating with the i3 window manager.
    Optional arguments:
    - path of the i3 socket. Path is retrieved from i3-wm itself via
      "i3.get_socket_path()" if not provided.
    - timeout in seconds
    - chunk_size in bytes
    - magic_string as a safety string for i3-ipc. Set to 'i3-ipc' by default.
    """
    magic_string = 'i3-ipc'  # safety string for i3-ipc
    chunk_size = 1024  # in bytes
    timeout = 0.5  # in seconds
    buffer = b''  # byte string
    
    def __init__(self, path=None, timeout=None, chunk_size=None,
                 magic_string=None):
        if not path:
            path = get_socket_path()
        self.path = path
        if timeout:
            self.timeout = timeout
        if chunk_size:
            self.chunk_size = chunk_size
        if magic_string:
            self.magic_string = magic_string
        # Socket initialization and connection
        self.initialize()
        self.connect()
        # Struct format initialization, length of magic string is in bytes
        self.struct_header = '<%dsII' % len(self.magic_string.encode('utf-8'))
        self.struct_header_size = struct.calcsize(self.struct_header)
    
    def initialize(self):
        """
        Initializes the socket.
        """
        self.socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.socket.settimeout(self.timeout)
    
    def connect(self, path=None):
        """
        Connects the socket to socket path if not already connected.
        """
        if not self.connected:
            self.initialize()
            if not path:
                path = self.path
            try:
                self.socket.connect(path)
            except socket.error:
                raise ConnectionError(path)
    
    def get(self, msg_type, payload=''):
        """
        Convenience method, calls "socket.send(msg_type, payload)" and
        returns data from "socket.receive()".
        """
        self.send(msg_type, payload)
        return self.receive()
    
    def subscribe(self, event_type, event=None):
        """
        Subscribes to an event. Returns data on first occurrence.
        """
        event_type = parse_event_type(event_type)
        # Create JSON payload from given event type and event
        payload = [event_type]
        if event:
            payload.append(event)
        payload = json.dumps(payload)
        return self.get('subscribe', payload)
    
    def send(self, msg_type, payload=''):
        """
        Sends the given message type with given message by packing them
        and continuously sending bytes from the packed message.
        """
        message = self.pack(msg_type, payload)
        # Continuously send the bytes from the message
        self.socket.sendall(message)
    
    def receive(self):
        """
        Tries to receive a data. Unpacks the received byte string if
        successful. Returns None on failure.
        """
        try:
            data = self.socket.recv(self.chunk_size)
            msg_magic, msg_length, msg_type = self.unpack_header(data)
            msg_size = self.struct_header_size + msg_length
            # Keep receiving data until the whole message gets through
            while len(data) < msg_size:
                data += self.socket.recv(msg_length)
            data = self.buffer + data
            return self.unpack(data)
        except socket.timeout:
            return None
    
    def pack(self, msg_type, payload):
        """
        Packs the given message type and payload. Turns the resulting
        message into a byte string.
        """
        msg_magic = self.magic_string
        # Get the byte count instead of number of characters
        msg_length = len(payload.encode('utf-8'))
        msg_type = parse_msg_type(msg_type)
        # "struct.pack" returns byte string, decoding it for concatenation
        msg_length = struct.pack('I', msg_length).decode('utf-8')
        msg_type = struct.pack('I', msg_type).decode('utf-8')
        message = '%s%s%s%s' % (msg_magic, msg_length, msg_type, payload)
        # Encoding the message back to byte string
        return message.encode('utf-8')
    
    def unpack(self, data):
        """
        Unpacks the given byte string and parses the result from JSON.
        Returns None on failure and saves data into "self.buffer".
        """
        data_size = len(data)
        msg_magic, msg_length, msg_type = self.unpack_header(data)
        msg_size = self.struct_header_size + msg_length
        # Message shouldn't be any longer than the data
        if data_size >= msg_size:
            payload = data[self.struct_header_size:msg_size].decode('utf-8')
            payload = json.loads(payload)
            self.buffer = data[msg_size:]
            return payload
        else:
            self.buffer = data
            return None
    
    def unpack_header(self, data):
        """
        Unpacks the header of given byte string.
        """
        return struct.unpack(self.struct_header, data[:self.struct_header_size])
    
    @property
    def connected(self):
        """
        Returns True if connected and False if not.
        """
        try:
            self.get('command')
            return True
        except socket.error:
            return False
    
    def close(self):
        """
        Closes the socket connection.
        """
        self.socket.close()


class Subscription(threading.Thread):
    """
    Creates a new subscription and runs a listener loop. Calls the
    callback on event.
    Example parameters:
    callback = lambda event, data, subscription: print(data)
    event_type = 'workspace'
    event = 'focus'
    event_socket = <i3.Socket object>
    data_socket = <i3.Socket object>
    """
    subscribed = False
    type_translation = {
        'workspace': 'get_workspaces',
        'output': 'get_outputs'
    }
    
    def __init__(self, callback, event_type, event=None, event_socket=None,
                 data_socket=None):
        # Variable initialization
        if not callable(callback):
            raise TypeError('Callback must be callable')
        event_type = parse_event_type(event_type)
        self.callback = callback
        self.event_type = event_type
        self.event = event
        # Socket initialization
        if not event_socket:
            event_socket = Socket()
        self.event_socket = event_socket
        self.event_socket.subscribe(event_type, event)
        if not data_socket:
            data_socket = Socket()
        self.data_socket = data_socket
        # Thread initialization
        threading.Thread.__init__(self)
        self.start()
    
    def run(self):
        """
        Wrapper method for the listen method -- handles exceptions.
        The method is run by the underlying "threading.Thread" object.
        """
        try:
            self.listen()
        except socket.error:
            self.close()
    
    def listen(self):
        """
        Runs a listener loop until self.subscribed is set to False.
        Calls the given callback method with data and the object itself.
        If event matches the given one, then matching data is retrieved.
        Otherwise, the event itself is sent to the callback.
        In that case 'change' key contains the thing that was changed.
        """
        self.subscribed = True
        while self.subscribed:
            event = self.event_socket.receive()
            if not event:  # skip an iteration if event is None
                continue
            if not self.event or ('change' in event and event['change'] == self.event):
                msg_type = self.type_translation[self.event_type]
                data = self.data_socket.get(msg_type)
            else:
                data = None
            self.callback(event, data, self)
        self.close()
    
    def close(self):
        """
        Ends subscription loop by setting self.subscribed to False and
        closing both sockets.
        """
        self.subscribed = False
        self.event_socket.close()
        if self.data_socket is not default_socket():
            self.data_socket.close()


def __call_cmd__(cmd):
    """
    Returns output (stdout or stderr) of the given command args.
    """
    try:
        output = subprocess.check_output(cmd)
    except subprocess.CalledProcessError as error:
        output = error.output
    output = output.decode('utf-8')  # byte string decoding
    return output.strip()


__socket__ = None
def default_socket(socket=None):
    """
    Returns i3.Socket object, which was initiliazed once with default values
    if no argument is given.
    Otherwise sets the default socket to the given socket.
    """
    global __socket__
    if socket and isinstance(socket, Socket):
        __socket__ = socket
    elif not __socket__:
        __socket__ = Socket()
    return __socket__


def msg(type, message=''):
    """
    Takes a message type and a message itself.
    Talks to the i3 via socket and returns the response from the socket.
    """
    response = default_socket().get(type, message)
    return response


def __function__(type, message='', *args, **crit):
    """
    Accepts a message type, a message. Takes optional args and keyword
    args which are present in all future calls of the resulting function.
    Returns a function, which takes arguments and container criteria.
    If message type was 'command', the function returns success value.
    """
    def function(*args2, **crit2):
        msg_full = ' '.join([message] + list(args)  + list(args2))
        criteria = dict(crit)
        criteria.update(crit2)
        if criteria:
            msg_full = '%s %s' % (container(**criteria), msg_full)
        response = msg(type, msg_full)
        response = success(response)
        if isinstance(response, i3Exception):
            raise response
        return response
    function.__name__ = type
    function.__doc__ = 'Message sender (type: %s, message: %s)' % (type, message)
    return function


def subscribe(event_type, event=None, callback=None):
    """
    Accepts an event_type and event itself.
    Creates a new subscription, prints data on every event until
    KeyboardInterrupt is raised.
    """
    if not callback:
        def callback(event, data, subscription):
            print('changed:', event['change'])
            if data:
                print('data:\n', data)
    
    socket = default_socket()
    subscription = Subscription(callback, event_type, event, data_socket=socket)
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print('')  # force newline
    finally:
        subscription.close()


def get_socket_path():
    """
    Gets the socket path via i3 command.
    """
    cmd = ['i3', '--get-socketpath']
    output = __call_cmd__(cmd)
    return output


def success(response):
    """
    Convenience method for filtering success values of a response.
    Each success dictionary is replaces with boolean value.
    i3.MessageError is returned if error key is found in any of the
    success dictionaries.
    """
    if isinstance(response, dict) and 'success' in response:
        if 'error' in response:
            return MessageError(response['error'])
        return response['success']
    elif isinstance(response, list):
        for index, item in enumerate(response):
            item = success(item)
            if isinstance(item, i3Exception):
                return item
            response[index] = item
    return response


def container(**criteria):
    """
    Turns keyword arguments into a formatted container criteria.
    """
    criteria = ['%s="%s"' % (key, val) for key, val in criteria.items()]
    return '[%s]' % ' '.join(criteria)


def parent(con_id, tree=None):
    """
    Searches for a parent of a node/container, given the container id.
    Returns None if no container with given id exists (or if the
    container is already a root node).
    """
    def has_child(node):
        for child in node['nodes']:
            if child['id'] == con_id:
                return True
        return False
    parents = filter(tree, has_child)
    if not parents or len(parents) > 1:
        return None
    return parents[0]

 
def filter(tree=None, function=None, **conditions):
    """
    Filters a tree based on given conditions. For example, to get a list of
    unfocused windows (leaf nodes) in the current tree:
      i3.filter(nodes=[], focused=False)
    The return value is always a list of matched items, even if there's
    only one item that matches.
    The user function should take a single node. The function doesn't have
    to do any dict key or index checking (this is handled by i3.filter
    internally).
    """
    if tree is None:
        tree = msg('get_tree')
    elif isinstance(tree, list):
        tree = {'list': tree}
    if function:
        try:
            if function(tree):
                return [tree]
        except (KeyError, IndexError):
            pass
    else:
        for key, value in conditions.items():
            if key not in tree or tree[key] != value:
                break
        else:
            return [tree]
    matches = []
    for nodes in ['nodes', 'floating_nodes', 'list']:
        if nodes in tree:
            for node in tree[nodes]:
                matches += filter(node, function, **conditions)
    return matches


class i3(ModuleType):
    """
    i3.py is a Python module for communicating with the i3 window manager.
    """
    def __init__(self, module):
        self.__module__ = module
        self.__name__ = module.__name__
    
    def __getattr__(self, name):
        """
        Turns a nonexistent attribute into a function.
        Returns the resulting function.
        """
        try:
            return getattr(self.__module__, name)
        except AttributeError:
            pass
        if name.lower() in self.__module__.MSG_TYPES:
            return self.__module__.__function__(type=name)
        else:
            return self.__module__.__function__(type='command', message=name)


# Turn the module into an i3 object
sys.modules[__name__] = i3(sys.modules[__name__])
