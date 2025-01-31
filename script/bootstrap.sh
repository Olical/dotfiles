#!/usr/bin/env bash

set -xe

if ! command -v yay &>/dev/null; then
	# sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf ./yay
	sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf ./yay-bin
fi

yay -S --needed stow git

./script/stow.sh
./script/install-packages.sh

chsh -s "$(which fish)"
