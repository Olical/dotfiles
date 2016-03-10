#!/usr/bin/env bash

ag "map <silent> <leader>" ~/.config/nvim --ignore mappings.sh --nogroup --nocolor | cut -d' ' -f3- | sort
