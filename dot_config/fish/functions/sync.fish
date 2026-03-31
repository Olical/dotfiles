function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  topgrade --disable containers vim guix uv

  nvim --headless "+Lazy! sync" +TSUpdate -c 'autocmd User MasonUpdateAllComplete quitall' -c 'MasonUpdateAll'

  # Pick up any changes (e.g. lazy-lock.json) and auto-commit/push.
  chezmoi re-add
end
