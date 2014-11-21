#!/usr/bin/env bash

ln -s ~/dotfiles/vim ~/.vim
echo "source $HOME/.vim/bootstrap.vim" >> ~/.vimrc
mkdir ~/.vim/undo/ ~/.vim/spell ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
