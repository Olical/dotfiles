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

## First time

```fish
sudo dnf group install development-tools
sudo dnf install procps-ng curl file
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Main Fedora repos
sudo dnf install \
  neovim \
  helix \
  fish \
  difftastic \
  syncthing \
  tailscale \
  gh \
  bat

# COPR (brew only has ghostty as a macOS cask, no Linux bottle)
sudo dnf copr enable scottames/ghostty
sudo dnf install ghostty

# Homebrew (not in main Fedora repos)
brew install \
  lazygit \
  mise \
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

# Install fish plugins (tide prompt etc) from fish_plugins
fisher update

# Generate mise completions
mise use -g usage
mise completions fish > ~/.config/fish/completions/mise.fish
```

## Migrating from COPR / scripts / cargo-binstall

If a machine was set up with the old method (COPR repos, curl scripts, cargo-binstall), run these steps to migrate to brew.

### Remove COPR packages and repos

```fish
# Remove the COPR-installed packages (keep ghostty on COPR, no brew Linux bottle)
sudo dnf remove lazygit mise topgrade yazi

# Remove the COPR repos (keep scottames/ghostty)
sudo dnf copr remove dejan/lazygit
sudo dnf copr remove jdxcode/mise
sudo dnf copr remove lilay/topgrade
sudo dnf copr remove lihaohong/yazi
```

### Remove cargo-binstall installed zellij

```fish
# Remove zellij installed via cargo-binstall
rm -f ~/.cargo/bin/zellij

# Remove cargo-binstall itself if no longer needed
rm -f ~/.cargo/bin/cargo-binstall
```

### Remove curl-script installed tools

```fish
# Remove duckdb (default install location)
rm -f ~/.duckdb/duckdb
rm -rf ~/.duckdb

# Remove fisher (will be reinstalled via brew)
# fisher is a fish function, removing it cleanly:
fisher remove jorgebucaran/fisher 2>/dev/null
rm -f ~/.config/fish/functions/fisher.fish
rm -f ~/.config/fish/completions/fisher.fish
```

### Install everything via brew

```fish
brew install \
  lazygit \
  mise \
  topgrade \
  yazi \
  zellij \
  duckdb \
  fisher \
  chojs23/tap/ec

# Reinstall fish plugins now that fisher is from brew
fisher update
```
