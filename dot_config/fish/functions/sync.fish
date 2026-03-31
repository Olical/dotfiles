function sync
  cd ~/repos/Olical/dotfiles

  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  git pull

  topgrade --disable containers vim guix uv

  nvim --headless "+Lazy! sync" +TSUpdate -c 'autocmd User MasonUpdateAllComplete quitall' -c 'MasonUpdateAll'
end
