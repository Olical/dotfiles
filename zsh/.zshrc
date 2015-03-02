export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"
DISABLE_AUTO_TITLE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
