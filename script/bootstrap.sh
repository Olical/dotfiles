#!/usr/bin/env bash

set -xe

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if ! command -v brew &> /dev/null
then
  sudo apt update && sudo apt install -y curl
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bash_profile
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile
fi

./script/install-packages.sh
stow --target=$HOME stowed
chsh -s `which fish`
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
~/.config/nvim/sync.sh
