function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/.config/nixpkgs; git pull --rebase --autostash; cd -

  if ! set -q DOTFILES_GUEST
    sudo nix-channel --update
    sudo nixos-rebuild switch --upgrade
  end

  nix-channel --update
  home-manager switch
  nix-collect-garbage --delete-older-than 14d

  if ! set -q DOTFILES_GUEST
    sudo nix-collect-garbage --delete-older-than 14d
    sudo journalctl --vacuum-time=10d
  end

  cd ~
  ~/.config/nvim/sync.sh
end
