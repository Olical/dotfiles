#!/usr/bin/env bash

set -xe

sudo apt update

sudo apt install -y \
  kitty fzf cowsay curl entr fish \
  httpie htop nodejs python3 stow tree \
  lua asciinema make ripgrep \
  fonts-firacode fonts-noto fonts-noto-cjk fonts-noto-color-emoji \
  libavcodec-extra ubuntu-restricted-extras

sudo apt install -y build-essential procps curl file git
brew install \
  fish neovim clojure clojure-lsp joker lazygit \
  lua-language-server xmlformat bitwarden-cli \
  borkdude/brew/babashka candid82/brew/joker
