#!/usr/bin/env bash

# Bash
echo "source $HOME/dotfiles/bash/bootstrap.sh" >> ~/.bashrc

# Git
echo "[include]
    path = $HOME/dotfiles/git/bootstrap.gitconfig" >> ~/.gitconfig

# Tmux
echo "source-file $HOME/dotfiles/tmux/bootstrap.tmux.conf" >> ~/.tmux.conf

# Vim
ln -s ~/dotfiles/vim ~/.vim
echo "source $HOME/.vim/bootstrap.vim" >> ~/.vimrc