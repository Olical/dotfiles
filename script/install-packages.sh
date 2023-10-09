#!/usr/bin/env bash

set -xe

yay -S --needed \
	kitty fzf cowsay entr fish httpie htop npm nodejs-lts-hydrogen \
	asciinema ripgrep clojure lazygit tree bitwarden-cli \
	babashka lua xclip ttf-fira-code ttf-dejavu-emojiless \
	noto-fonts-emoji gnome-keyring topgrade neovim leiningen \
	difftastic direnv ttf-firacode-nerd luarocks fennel \
	fd sd spectacle rsync bat jq yq firefox flatpak docker docker-compose \
	rustup flameshot adobe-source-han-sans-kr-fonts less man

flatpak install -y flathub us.zoom.Zoom com.discordapp.Discord

sudo systemctl enable docker
sudo systemctl start docker

rustup default stable
