#!/usr/bin/env bash

PACKAGES=~/.emacs.d/config/packages.el

emacs --batch -l $PACKAGES -f dotfiles-sync
rm ~/.emacs.d/el-get/.loaddefs.*
emacs --batch -l $PACKAGES
