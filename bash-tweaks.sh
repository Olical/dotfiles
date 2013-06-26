export EDITOR=vim
export TERM=xterm-256color
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\W\[$(tput setaf 1)\]\\$ \[$(tput sgr0)\]"

alias ls="ls --color=always"
alias less="less -R"
alias ag="ag --color"

echo $'\e[00;31mDON\'T PANIC\e[00m'