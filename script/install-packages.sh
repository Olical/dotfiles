#!/usr/bin/env bash

set -xe

yay -S --needed \
	asciinema \
	bat \
	fennel \
	clojure \
	leiningen \
	babashka \
	cowsay \
	difftastic \
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
	thunar \
	usage \
	mise

sudo systemctl enable docker
sudo systemctl start docker

xdg-settings set default-web-browser firefox.desktop

rustup default stable
