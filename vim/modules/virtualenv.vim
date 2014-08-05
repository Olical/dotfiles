" Enable virtualenv.
if has('python') && !empty($VIRTUAL_ENV)
python << EOF
  import os
  import sys
  a = os.environ['VIRTUAL_ENV'] + '/bin/activate_this.py'
  execfile(a, dict(__file__ = a))
  if 'PYTHONPATH' not in os.environ:
    os.environ['PYTHONPATH'] = ''
    os.environ['PYTHONPATH'] += ':' + os.getcwd()
    os.environ['PYTHONPATH'] += ':'.join(sys.path)
EOF
endif
