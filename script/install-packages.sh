#!/usr/bin/env bash

set -xe

yay -S --needed \
	asciinema \
	bat \
	rbw \
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
	ttf-font-awesome \
	noto-fonts-emoji \
	noto-fonts-cjk \
	adobe-source-han-sans-kr-fonts \
	ttf-dejavu-emojiless \
	ttf-fira-code \
	ttf-firacode-nerd \
	wl-clipboard \
	wev \
	sway \
	swaylock \
	swayidle \
	swaybg \
	waybar \
	kitty \
	pavucontrol \
	wofi \
	mako \
	network-manager-applet \
	brightnessctl \
	volumectl \
	grim \
	slurp \
	playerctl

flatpak install -y flathub us.zoom.Zoom com.discordapp.Discord

sudo systemctl enable docker
sudo systemctl start docker

rustup default stable
