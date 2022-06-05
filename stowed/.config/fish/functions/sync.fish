function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  topgrade --disable git_repos containers vim

  cd ~/.config/nvim
  git pull --rebase --autostash
  ./sync.sh
  cd -
end
