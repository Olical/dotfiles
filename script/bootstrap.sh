#!/usr/bin/env bash

set -xe

if ! command -v yay &>/dev/null; then
	sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf ./yay
fi

yay -S --needed stow git

if [ ! -d "$HOME/.config/nvim" ]; then
	git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
fi

./script/stow.sh
./script/install-packages.sh
chsh -s "$(which fish)"
