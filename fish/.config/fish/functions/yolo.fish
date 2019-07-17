function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/dotfiles; git pull; cd -

  yay -Syu --noconfirm
  env DIFFPROG="nvim -d suda://" pacdiff

  ~/.config/nvim/sync.sh

  maintenance
end
