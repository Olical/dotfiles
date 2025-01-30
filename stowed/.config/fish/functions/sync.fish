function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  topgrade --disable git_repos containers vim guix

  cd ~/repos/Olical/dotfiles
  git checkout -- stowed/.config/nvim/lazy-lock.json
  git pull
  cd -

  nvim --headless "+Lazy! sync" +TSUpdateSync -c 'autocmd User MasonUpdateAllComplete quitall' -c 'MasonUpdateAll'
end
