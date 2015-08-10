set PATH ~/bin ~/npm/bin $PATH
set fish_greeting ""

# Kill all running containers.
alias dockerkill='docker kill (docker ps -q)'

# Delete all docker images and containers.
alias dockernuke='docker rm (docker ps -a -q); docker rmi -f (docker images -q)'

# Git.
alias g="git"
alias gs="git status -sb"
alias gb="git branch"
alias gc="git commit"
alias ga="git add"
alias gco="git checkout"
alias gl="git pull"
alias gp="git push"
alias gf="git fetch"
alias gmt="git mergetool"
alias gm="git merge"
alias gr="git remote"
alias gre="git rebase"
alias glg="git log --stat"
alias gd="git diff"

# Local config.
if [ -f ~/.local.fish ]
  . ~/.local.fish
end
