mkdir -p ~/bin ~/npm/bin ~/.cargo/bin ~/.gem/ruby/2.5.0/bin

set fish_greeting ""
set LANG en_GB.UTF-8
set PATH ~/bin ~/npm/bin ~/.cargo/bin ~/.gem/ruby/2.5.0/bin $PATH
set BROWSER chromium
set EDITOR nvim
set VISUAL nvim

# Kill all running containers.
alias dockerkill='docker kill (docker ps -q)'

# Delete all docker images and containers.
alias dockernuke='docker rm (docker ps -a -q); docker rmi -f (docker images -q)'

# Other git aliases are in git config
alias g="git"

# Some software still uses vimdiff
alias vimdiff="nvim -d"

# Start an SSH agent if required, if not, connect to it.
initialise_ssh_agent

# Prevent funky output inside emacs terminals.
if test "$TERM" = "eterm-color"
  function fish_title; end
end

# Local config.
if [ -f ~/.local.fish ]
  source ~/.local.fish
end
