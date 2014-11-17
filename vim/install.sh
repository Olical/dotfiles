#!/usr/bin/env bash

ln -s ~/dotfiles/vim ~/.vim
echo "source $HOME/.vim/bootstrap.vim" >> ~/.vimrc
mkdir ~/.vim/bundle/ ~/.vim/undo/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
