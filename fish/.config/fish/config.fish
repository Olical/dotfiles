mkdir -p ~/bin ~/npm/bin ~/.cargo/bin ~/.gem/ruby/2.5.0/bin
set -gx PATH ~/bin ~/npm/bin ~/.cargo/bin ~/.gem/ruby/2.5.0/bin $PATH

set -gx fish_greeting ""
set -gx LANG en_GB.UTF-8
set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\" 2> /dev/null"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

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
