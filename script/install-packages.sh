#!/usr/bin/env bash

set -xe

yay -S --needed \
	adobe-source-han-sans-kr-fonts \
	asciinema \
	babashka \
	bat \
	bitwarden-cli \
	clojure \
	cowsay \
	difftastic \
	direnv \
	docker \
	docker-compose \
	entr \
	fd \
	fennel \
	firefox \
	fish \
	flatpak \
	fzf \
	htop \
	httpie \
	jq \
	lazydocker \
	lazygit \
	leiningen \
	less \
	lua \
	luarocks \
	man \
	neovim \
	nodejs \
	noto-fonts-emoji \
	npm \
	obsidian \
	ripgrep \
	rsync \
	rustup \
	sd \
	topgrade \
	tree \
	ttf-dejavu-emojiless \
	ttf-fira-code \
	ttf-firacode-nerd \
	wl-clipboard \
	yq \
	zoxide

flatpak install -y flathub us.zoom.Zoom com.discordapp.Discord

sudo systemctl enable docker
sudo systemctl start docker

rustup default stable
