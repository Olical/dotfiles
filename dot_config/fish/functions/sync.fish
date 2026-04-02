function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  topgrade --disable containers vim guix uv

  nvim --headless "+Lazy! sync" +TSUpdate -c 'lua require("mason-update-all").update_all(function() vim.cmd("quitall") end)'

  # Pick up any changes (e.g. lazy-lock.json) and auto-commit/push.
  chezmoi re-add
end
