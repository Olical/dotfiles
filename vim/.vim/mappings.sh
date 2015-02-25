#!/usr/bin/env bash

ag "map <silent> <leader>" ~/.vim --ignore mappings.sh --nogroup --nocolor | cut -d' ' -f3- | sort
