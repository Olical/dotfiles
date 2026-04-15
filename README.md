# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Package philosophy

- **Main Fedora dnf** is the default for everything available there.
- **Homebrew** for anything not in the main Fedora repos (preferred over COPR).
- **COPR** only when brew doesn't have a Linux package (e.g. ghostty).
- **Curl scripts** only as a last resort when neither dnf nor brew has the package.

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

## First time setup

```bash
sudo dnf group install development-tools
sudo dnf install procps-ng curl file
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Get brew on PATH for the rest of this bash session
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Main Fedora repos
sudo dnf install \
  neovim \
  helix \
  fish \
  difftastic \
  syncthing \
  tailscale \
  gh \
  bat \
  fzf \
  zoxide

# Ghostty — desktop only, not for headless hosts
sudo dnf copr enable scottames/ghostty
sudo dnf install ghostty

# Homebrew (not in main Fedora repos)
brew install \
  lazygit \
  mise \
  sops \
  age \
  topgrade \
  yazi \
  zellij \
  duckdb \
  fisher \
  chojs23/tap/ec

sudo systemctl enable --now "syncthing@olical.service"
sudo systemctl enable --now tailscaled

sudo tailscale login

# No brew formula available yet
curl -fsSL https://claude.ai/install.sh | bash

chsh -s /usr/bin/fish
```

Now drop into fish to finish setup:

```fish
exec fish

# Install fish plugins (tide prompt etc) from fish_plugins
fisher update

# Generate mise completions
mise use -g usage
mise completions fish > ~/.config/fish/completions/mise.fish
```
