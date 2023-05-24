#!/usr/bin/env bash

set -xe

yay -S --needed \
  kitty fzf cowsay entr fish httpie htop npm nodejs \
  asciinema ripgrep clojure clojure-lsp lazygit tree \
  lua-language-server bash-language-server bitwarden-cli \
  babashka lua xclip ttf-fira-code ttf-dejavu-emojiless \
  noto-fonts-emoji gnome-keyring topgrade neovim leiningen \
  difftastic direnv

npm install -g typescript-language-server
