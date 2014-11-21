DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias vi='echo "I think you mean vim..."'
export EDITOR='vim'

export FZF_DEFAULT_COMMAND='ag -l -g ""'

alias gs='git status --short --branch'
alias gup='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'

source $DIR/prompt.sh
