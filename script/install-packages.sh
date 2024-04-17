#!/usr/bin/env bash

set -xe

yay -S --needed \
	asciinema \
	bat \
	bitwarden-cli \
	fennel \
	clojure \
	leiningen \
	babashka \
	cowsay \
	difftastic \
	direnv \
	docker \
	docker-compose \
	entr \
	fd \
	sd \
	firefox \
	fish \
	zoxide \
	flatpak \
	fzf \
	htop \
	httpie \
	jq \
	yq \
	lazydocker \
	lazygit \
	less \
	lua \
	luarocks \
	man \
	neovim \
	nodejs \
	npm \
	obsidian \
	ripgrep \
	rsync \
	rustup \
	topgrade \
	tree \
	noto-fonts-emoji \
	adobe-source-han-sans-kr-fonts \
	ttf-dejavu-emojiless \
	ttf-fira-code \
	ttf-firacode-nerd \
	wl-clipboard \
	sway \
	foot

flatpak install -y flathub us.zoom.Zoom com.discordapp.Discord

sudo systemctl enable docker
sudo systemctl start docker

rustup default stable
