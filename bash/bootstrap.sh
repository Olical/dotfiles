DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias vi='echo "I think you mean vim..."'
export EDITOR='vim'

alias gs='git status --short --branch'
alias gup='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'

source $DIR/prompt.sh
