#!/usr/bin/env bash

ln -s ~/dotfiles/vim ~/.vim
echo "source $HOME/.vim/bootstrap.vim" >> ~/.vimrc
