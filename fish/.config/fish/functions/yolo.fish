function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/dotfiles; git pull; cd -

  yay -Syu --noconfirm
  sudo env DIFFPROG="nvim -d" pacdiff

  ~/.config/nvim/sync.sh

  maintenance
end
