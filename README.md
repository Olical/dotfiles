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

sudo dnf install \
  neovim \
  helix \
  ghostty \
  fish \
  lazygit \
  difftastic \
  mise

chsh -s /usr/bin/fish
```
