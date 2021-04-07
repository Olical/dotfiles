#!/usr/bin/env bash

CONFIG=$HOME/.config/nvim
mkdir -p $CONFIG/undo $CONFIG/spell $CONFIG/autoload
rm -rf $CONFIG/lua
nvim +"au User PackerComplete qa" +PackerSync
