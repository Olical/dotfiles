#!/usr/bin/env bash

PACKAGES=~/.emacs.d/config/packages.el
ELGET=~/.emacs.d/el-get/

if [ ! -d $ELGET ]; then
    mkdir $ELGET
    git clone git@github.com:dimitri/el-get.git $ELGET/el-get
fi

emacs --batch -l $PACKAGES -f dotfiles-sync
rm ~/.emacs.d/el-get/.loaddefs.*
emacs --batch -l $PACKAGES
