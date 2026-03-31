if type -q nvim
  set -gx EDITOR nvim
  set -gx VISUAL nvim
  alias vimdiff="nvim -d"
end

set -gx PAGER less
set -gx SUDO_ASKPASS '/usr/bin/lxqt-openssh-askpass'

set -U fish_greeting

# Other git aliases are in git config
alias g="git"
alias gg="g a .; and g c -a"
alias lg="lazygit"
alias n="nvim"

# Start an SSH agent if required, if not, connect to it.
initialise_ssh_agent

# Local config.
if [ -f ~/.config.fish ]
  source ~/.config.fish
end

mise activate fish | source
zoxide init --cmd cd fish | source

if status is-interactive
    set ZELLIJ_AUTO_ATTACH false
    set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)
end
