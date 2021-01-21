set -gx NPM_PACKAGES "$HOME/.npm-packages"
set -gx JANET_PATH ~/.cache/janet
set -gx NODE_PATH "$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
set -gx PATH ~/bin $NPM_PACKAGES/bin ~/.cargo/bin ~/.luarocks/bin $PATH

mkdir -p ~/bin $NPM_PACKAGES/bin ~/.cargo/bin ~/.luarocks/bin $JANET_PATH

set -gx fish_greeting ""
set -gx BROWSER firefox

if type -q direnv
  eval (direnv hook fish)
end

if type -q nvim
  set -gx EDITOR nvim
  set -gx VISUAL nvim
  set -gx MANPAGER "nvim +Man! -c ':set signcolumn='"
  alias vimdiff="nvim -d"
end

if locale -a | grep -q en_GB.UTF-8
  set -gx LANG en_GB.UTF-8
end

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\" 2> /dev/null"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Other git aliases are in git config
alias g="git"
alias gg="g a .; and g c -a"
alias lg="lazygit"

# Start an SSH agent if required, if not, connect to it.
initialise_ssh_agent

# Local config.
if [ -f ~/.local.fish ]
  source ~/.local.fish
end
