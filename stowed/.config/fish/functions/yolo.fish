function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/.config/nixpkgs; git pull --rebase --autostash; cd -

  if ! set -q DOTFILES_GUEST
    sudo nix-channel --update
    sudo nixos-rebuild switch
  end

  nix-channel --update
  home-manager switch
  nix-env --delete-generations 14d

  if ! set -q DOTFILES_GUEST
    sudo nix-env --delete-generations 14d
    nix-store --gc
    sudo journalctl --vacuum-time=10d
  end

  ~/.config/nvim/sync.sh
end
