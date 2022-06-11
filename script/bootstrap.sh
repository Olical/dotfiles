#!/usr/bin/env bash

set -xe

yay -S --needed stow
stow --target=$HOME stowed
./script/install-packages.sh
chsh -s `which fish`
~/.config/nvim/sync.sh
