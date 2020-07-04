function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/.config/nixpkgs; git pull; cd -

  sudo nix-channel --update
  sudo nixos-rebuild switch

  nix-channel --update
  home-manager switch

  sudo nix-env --delete-generations 14d
  sudo nix-store --gc

  ~/.config/nvim/sync.sh
end
