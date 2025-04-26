function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  (cd ~/repos/Olical/dotfiles; and git pull)

  topgrade --disable containers vim guix uv

  nvim --headless "+Lazy! sync" +TSUpdateSync -c 'autocmd User MasonUpdateAllComplete quitall' -c 'MasonUpdateAll'
end
