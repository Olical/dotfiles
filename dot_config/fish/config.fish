if type -q nvim
    # Helix?
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    alias vimdiff="nvim -d"
end

set -gx PAGER less
set -g fish_greeting

# Other git aliases are in git config
alias g="git"
alias gg="g a .; and g c -a"
alias lg="lazygit"
alias zj="zellij -l welcome"
alias cm="chezmoi"
alias n="nvim"

if string match -q arch (cat /etc/os-release | string match -r 'ID=(.*)' | tail -1)
    alias hx="helix"
    set -gx SUDO_ASKPASS /usr/bin/lxqt-openssh-askpass
    initialise_ssh_agent
end

# Local config.
if [ -f ~/.config.fish ]
    source ~/.config.fish
end

mise activate fish | source
zoxide init --cmd cd fish | source

if status is-interactive; and not set -q ZELLIJ
    zj
    # Only exit fish if zellij exited cleanly.
    # If it crashed (e.g. bad config), we keep the shell so we can fix things.
    if test $status -eq 0
        kill $fish_pid
    end
end
