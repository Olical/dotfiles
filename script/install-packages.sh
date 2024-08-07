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
	lazydocker-bin \
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
	xdg-desktop-portal-wlr \
	kitty \
	pavucontrol \
	wofi \
	mako \
	network-manager-applet \
	brightnessctl \
	volumectl \
	grim \
	slurp \
	playerctl \
	lxsession \
	thunar

flatpak install -y flathub com.discordapp.Discord

sudo systemctl enable docker
sudo systemctl start docker

rustup default stable

xdg-settings set default-web-browser firefox.desktop
