function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/.config/nixpkgs; git pull --no-rebase; cd -

  if ! set -q DOTFILES_GUEST
    sudo nix-channel --update
    sudo nixos-rebuild switch
  end

  nix-channel --update
  home-manager switch

  if ! set -q DOTFILES_GUEST
    sudo nix-env --delete-generations 14d
    sudo nix-store --gc
  end

  ~/.config/nvim/sync.sh
end
