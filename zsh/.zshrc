export ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
export BROWSER="firefox-developer"

ZSH_THEME="clean"
DISABLE_AUTO_TITLE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Git short cuts.
alias ga='git add'
alias gbi='git bisect'
alias gb='git branch'
alias gc='git commit'
alias gch='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gf='git fetch'
alias gg='git grep'
alias gi='git init'
alias gl='git log'
alias gm='git merge'
alias gmv='git mv'
alias gpl='git pull'
alias gpu='git push'
alias gr='git rebase'
alias gres='git reset'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'
alias gt='git tag'

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
