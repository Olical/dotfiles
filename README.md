# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## New machine setup

```
sudo dnf install chezmoi
chezmoi init --apply Olical
```

## Daily usage

```fish
# Pull and apply latest changes
chezmoi update

# Re-add changed files to chezmoi source
chezmoi re-add

# Enter the chezmoi source repo for git operations
chezmoi cd

# Update system packages and neovim plugins
sync
```

## First time

```fish
sudo dnf group install development-tools
sudo dnf install procps-ng curl file
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

sudo dnf copr enable dejan/lazygit
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable jdxcode/mise
sudo dnf copr enable lilay/topgrade
sudo dnf copr enable lihaohong/yazi

sudo dnf install \
  neovim \
  helix \
  ghostty \
  fish \
  lazygit \
  difftastic \
  topgrade \
  syncthing \
  tailscale \
  yazi \
  gh \
  bat

brew install chojs23/tap/ec

cargo binstall zellij

sudo systemctl enable --now "syncthing@olical.service
sudo systemctl enable --now tailscaled

sudo tailscale login

curl -fsSL https://claude.ai/install.sh | bash

curl https://install.duckdb.org | sh

chsh -s /usr/bin/fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install fish plugins (tide prompt etc) from fish_plugins
fisher update

# Generate mise completions
mise use -g usage
mise completions fish > ~/.config/fish/completions/mise.fish
```
