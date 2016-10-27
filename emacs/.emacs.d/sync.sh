#!/usr/bin/env bash

emacs --batch -l package-bootstrap.el -f package-refresh-contents
emacs --batch -l init.el
