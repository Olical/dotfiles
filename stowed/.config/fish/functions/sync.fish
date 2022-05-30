function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  yay

  cd ~/.config/nvim
  git pull --rebase --autostash
  ./sync.sh
  cd -
end
