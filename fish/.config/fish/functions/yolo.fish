function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/dotfiles; git pull; cd -

  yaourt -Syua --noconfirm
  yaourt -C

  ~/.config/nvim/sync.sh

  maintenance
end
