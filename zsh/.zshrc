export ZSH=$HOME/.oh-my-zsh
export EDITOR='vim'

ZSH_THEME="clean"
DISABLE_AUTO_TITLE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Delete all docker images
alias dockernuke='docker rmi -f $(docker images -q)'

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
