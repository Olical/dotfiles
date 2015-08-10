set PATH ~/bin ~/npm/bin $PATH
set fish_greeting ""

function fish_prompt
  set_color green
  echo -n  'λ '
  set_color normal
end

function fish_right_prompt
  set_color blue
  echo -n (basename (pwd | sed "s#$HOME#\~#"))
  set_color normal
end

# Kill all running containers.
alias dockerkill='docker kill (docker ps -q)'

# Delete all docker images and containers.
alias dockernuke='docker rm (docker ps -a -q); docker rmi -f (docker images -q)'

# Fixes stuff.
alias fuck='eval (thefuck (fc -ln -1 | tail -n 1)); fc -R'

# Git.
alias gs="git status -sb"
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
