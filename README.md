# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## New machine setup

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --branch chezmoi Olical
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

## Packages

```
neovim
chezmoi
ghostty
fish
```
