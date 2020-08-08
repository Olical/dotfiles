function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/.config/nixpkgs; git pull --no-rebase; cd -

  if ! set -q DOTFILES_GUEST; and ! set -q DOTFILES_JUST_NIX
    sudo nix-channel --update
    sudo nixos-rebuild switch
  end

  nix-channel --update
  home-manager switch
  nix-env --delete-generations 14d

  if ! set -q DOTFILES_GUEST
    if ! set -q DOTFILES_JUST_NIX
      sudo nix-env --delete-generations 14d
    end

    nix-store --gc

    if type -q apt-get
      sudo apt-get update
      sudo apt-get upgrade -y
    end
  end

  ~/.config/nvim/sync.sh
end
