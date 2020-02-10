#!/usr/bin/env bash

set -xe

# Base packages
sudo apt -y update
sudo apt -y upgrade
sudo apt install -y \
    httpie curl fish kitty stow cowsay fzf htop leiningen xclip \
    tree fonts-firacode ripgrep build-essential linuxbrew-wrapper \
    python3-pip

# Ensure brew's bin is on the path
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

# Terminal and shell
chsh -s `which fish`
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

# More software!
brew update
brew upgrade
brew install \
    neovim node rustup-init clojure \
    borkdude/brew/clj-kondo candid82/brew/joker \
    jesseduffield/lazygit/lazygit

pip2 install pynvim
pip3 install pynvim

sudo snap refresh
sudo snap install discord
sudo snap install spotify

# Link all configuration
stow --restow `ls -d */`

# Neovim
./neovim/.config/nvim/sync.sh

# Rust
rustup toolchain install nightly
rustup default nightly

## TODO update script including brew, snap and apt
