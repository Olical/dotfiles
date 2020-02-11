#!/usr/bin/env bash

CONFIG=$HOME/dotfiles/neovim/.config/nvim

mkdir -p $CONFIG/undo $CONFIG/spell $CONFIG/autoload

if [ ! -f $CONFIG/autoload/plug.vim ]; then
    curl -fLo $CONFIG/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

pushd $CONFIG
make clean
popd

nvim +"PlugSnapshot! $CONFIG/snapshot.vim" +PlugUpgrade +PlugClean! +PlugUpdate +qa
nvim +UpdateRemotePlugins +qa
