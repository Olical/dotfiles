function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  sudo apt update
  sudo apt upgrade

  brew update
  brew upgrade

  cd ~/.config/nvim
  git pull --rebase --autostash
  ./sync.sh
  cd -
end
