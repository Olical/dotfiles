#!/usr/bin/env bash

set -xe

./script/install-packages.sh
stow --target=$HOME stowed
chsh -s `which fish`
~/.config/nvim/sync.sh
