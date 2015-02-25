#!/usr/bin/env bash

vim +"PlugSnapshot $HOME/.vim/revert.sh" +PlugUpgrade +PlugClean! +PlugUpdate +qa
