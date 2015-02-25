#!/usr/bin/env bash

mkdir ~/.vim/undo/ ~/.vim/spell ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
~/.vim/update.sh
