function yolo
  # Early sudo because it's needed later.
  sudo echo "Updating the entire bloody universe."

  cd ~/dotfiles; git pull; cd -

  sudo apt -y update
  sudo apt -y upgrade

  brew update
  brew upgrade

  sudo snap refresh

  ~/.config/nvim/sync.sh
end
