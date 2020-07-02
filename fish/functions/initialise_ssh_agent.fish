setenv SSH_ENV $HOME/.ssh/environment

function initialise_ssh_agent
  if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    end
  else
    if [ -f $SSH_ENV ]
      . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      test_identities
    else
      start_agent
    end
  end
end

function add_keys
  find ~/.ssh -type f -regex ".*\(id_rsa\|.*\.pem\)" | xargs ssh-add
end

function start_agent
  ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
  chmod 600 $SSH_ENV
  . $SSH_ENV > /dev/null
  add_keys
end

function test_identities
  ssh-add -l | grep "The agent has no identities" > /dev/null
  if [ $status -eq 0 ]
    add_keys
    if [ $status -eq 2 ]
      start_agent
      end
  end
end
