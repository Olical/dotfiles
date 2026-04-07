# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## New machine setup

```
sudo dnf install chezmoi
chezmoi init --apply --branch chezmoi Olical
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

```
sudo dnf copr enable dejan/lazygit
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable jdxcode/mise
sudo dnf copr enable lilay/topgrade

sudo dnf install \
  neovim \
  helix \
  ghostty \
  fish \
  lazygit \
  difftastic \
  topgrade

chsh -s /usr/bin/fish

curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
cargo binstall zellij

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install fish plugins (tide prompt etc) from fish_plugins
fisher update

# Generate mise completions
mise use -g usage
mise completions fish > ~/.config/fish/completions/mise.fish
```
