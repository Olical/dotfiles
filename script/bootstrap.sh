#!/usr/bin/env bash

set -xe

./script/install-system-packages.sh
stow --target=$HOME stowed
./script/install-user-packages.sh
chsh -s `which fish`
~/.config/nvim/sync.sh
