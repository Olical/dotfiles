#!/usr/bin/env bash

yaourt -Syua && cd ~/dotfiles && git pull && ~/.vim/sync.sh
