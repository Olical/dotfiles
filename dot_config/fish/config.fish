fish_add_path ~/.local/bin

set -gx EDITOR hx
set -gx VISUAL hx
set -gx PAGER less
set -g fish_greeting

# Other git aliases are in git config
alias g="git"
alias gg="g a .; and g c -a"
alias lg="lazygit"
alias zj="zellij -l welcome"
alias cm="chezmoi"
alias n="nvim"

# Some messy stuff that's Arch specific. Not needed on Fedora.
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

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if status is-interactive; and not set -q ZELLIJ; and command -q zellij
    zj
    # Only exit fish if zellij exited cleanly.
    # If it crashed (e.g. bad config), we keep the shell so we can fix things.
    if test $status -eq 0
        kill $fish_pid
    end
end
