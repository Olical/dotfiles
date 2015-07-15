export ZSH=/usr/share/oh-my-zsh
export EDITOR="vim"
export BROWSER="firefox"

ZSH_THEME="clean"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
plugins=()

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Add ~/bin and ~/npm/bin to the path.
path=(
    $HOME/bin
    $HOME/npm/bin
    $path
)

# Adds highlighting to man pages.
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Kill all running containers.
alias dockerkill='docker kill $(docker ps -q)'

# Delete all docker images and containers.
alias dockernuke='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'

# Quick git status.
alias gs='gst -sb'

# LS colours.
if which programname >/dev/null; then
  eval $(dircolors ~/.dircolors)
fi

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
