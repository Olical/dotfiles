#!/usr/bin/env bash

sudo apt -y update
sudo apt -y upgrade

sudo snap install discord
sudo snap install spotify
sudo snap install --edge node --classic

sudo apt install -y httpie curl fish kitty stow cowsay fzf htop leiningen xclip
sudo apt install -y tree fonts-firacode ripgrep build-essential linuxbrew-wrapper python3-pip

brew install rustup-init neovim clojure borkdude/brew/clj-kondo candid82/brew/joker
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

pip2 install pynvim
pip3 install pynvim

# Link all configuration
stow --restow `ls -d */`

# Terminal and shell
chsh -s `which fish`
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

# Neovim
./neovim/.config/nvim/sync.sh

# Rust
rustup toolchain install nightly
rustup default nightly

## TODO update script including brew, snap and apt
