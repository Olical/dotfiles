fish_add_path ~/.local/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

# Ensure brew-installed fish packages (fisher, etc.) are found even when
# fish itself was installed via dnf rather than brew.
if set -q HOMEBREW_PREFIX
    set -p fish_function_path $HOMEBREW_PREFIX/share/fish/vendor_functions.d
    set -p fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
end

set -gx EDITOR hx
set -gx VISUAL hx
set -gx PAGER less
set -g fish_greeting

# Syntax highlighting colours matching Monokai Pro palette.
# Not stored in fish_variables since that file is gitignored.
set -g fish_color_normal fcfcfa
set -g fish_color_command a9dc76
set -g fish_color_keyword ff6188
set -g fish_color_quote ffd866
set -g fish_color_redirection 78dce8
set -g fish_color_end ff6188
set -g fish_color_error ff6188 --bold
set -g fish_color_param fc9867
set -g fish_color_comment 727072
set -g fish_color_selection --background=5b595c
set -g fish_color_operator ff6188
set -g fish_color_escape ab9df2
set -g fish_color_autosuggestion 727072
set -g fish_color_cancel 727072
set -g fish_color_search_match --background=5b595c
set -g fish_color_valid_path --underline

# Other git aliases are in git config
alias g="git"
alias gg="g a .; and g c -a"
alias lg="lazygit"
alias zj="zellij"
alias cm="chezmoi"

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
