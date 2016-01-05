#!/usr/bin/env bash

mkdir -p ~/.vim/undo/ ~/.vim/spell ~/.vim/autoload

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +"PlugSnapshot! $HOME/.vim/snapshot.vim" +PlugUpgrade +PlugClean! +PlugUpdate +qa
