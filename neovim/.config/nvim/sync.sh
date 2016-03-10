#!/usr/bin/env bash

CONFIG=$HOME/.config/nvim

mkdir -p $CONFIG/undo/ $CONFIG/spell $CONFIG/autoload

if [ ! -f $CONFIG/plug.vim ]; then
    curl -fLo $CONFIG/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +"PlugSnapshot! $CONFIG/snapshot.vim" +PlugUpgrade +PlugClean! +PlugUpdate +qa
