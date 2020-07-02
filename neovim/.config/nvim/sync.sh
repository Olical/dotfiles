#!/usr/bin/env bash

CONFIG=$HOME/.config/nvim

mkdir -p $CONFIG/undo $CONFIG/spell $CONFIG/autoload

if [ -f $CONFIG/autoload/plug.vim ]; then
  rm -rf $CONFIG/lua
  nvim +"PlugSnapshot! $CONFIG/snapshot.vim" +PlugUpgrade +PlugClean! +PlugUpdate +qa
  nvim +UpdateRemotePlugins +qa
else
  curl -fLo $CONFIG/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim +PlugInstall
  nvim +UpdateRemotePlugins +qa
fi
