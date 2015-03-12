export ZSH=$HOME/.oh-my-zsh
export EDITOR='vim'

ZSH_THEME="clean"
DISABLE_AUTO_TITLE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
