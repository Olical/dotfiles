#!/usr/bin/env bash

vim +"PlugSnapshot $HOME/dotfiles/vim/revert.sh" +PlugUpgrade +PlugClean! +PlugUpdate +qa
