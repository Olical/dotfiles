#!/usr/bin/env bash

emacs --user `whoami` --batch -l ~/.emacs.d/package-bootstrap.el -f package-refresh-contents
emacs --user `whoami` --batch -l ~/.emacs.d/init.el --eval "(paradox-upgrade-packages)"
