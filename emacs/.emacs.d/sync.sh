#!/usr/bin/env bash

emacs --batch -l ~/.emacs.d/package-bootstrap.el -f package-refresh-contents
emacs --batch -l ~/.emacs.d/init.el
