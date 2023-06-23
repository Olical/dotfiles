set -gx NPM_DIR "$HOME/.npm-data"
set -gx NODE_PATH "$NPM_DIR/lib/node_modules:$NODE_PATH"
set -gx PATH ~/bin $NPM_DIR/bin $HOME/.local/bin $PATH

mkdir -p ~/bin $NPM_DIR/bin

set -gx fish_greeting ""

test -d ~/.linuxbrew && eval (~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if type -q nvim
  set -gx EDITOR nvim
  set -gx VISUAL nvim
  set -gx MANPAGER "nvim +Man!"
  alias vimdiff="nvim -d"
end

if type -q direnv
  direnv hook fish | source
end

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\" 2> /dev/null"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Other git aliases are in git config
alias g="git"
alias gg="g a .; and g c -a"
alias lg="lazygit"
alias n="neovide"
alias nt="neovim"

# Start an SSH agent if required, if not, connect to it.
initialise_ssh_agent

# Local config.
if [ -f ~/.config.fish ]
  source ~/.config.fish
end
