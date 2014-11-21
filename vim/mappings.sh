#!/usr/bin/env bash

ag "map <leader>" ~/.vim --ignore mappings.sh --nogroup --nocolor | cut -d' ' -f2-
