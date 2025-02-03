#!/usr/bin/env bash

set -xe

yay -S --needed \
	asciinema \
	bat \
	fennel \
	clojure \
	leiningen \
	babashka \
	rlwrap \
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
	tree-sitter \
	nodejs \
	npm \
	obsidian \
	ripgrep \
	rsync \
	rustup \
	topgrade-bin \
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
	ghostty \
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
	thunar-volman \
	usage-bin \
	mise-bin \
	lxqt-openssh-askpass

sudo systemctl enable docker
sudo systemctl start docker

xdg-settings set default-web-browser firefox.desktop

rustup default stable
