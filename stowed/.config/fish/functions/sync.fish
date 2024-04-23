function sync
  # Early sudo because it's needed later.
  sudo echo "Updating everything!"

  topgrade --disable git_repos containers vim

  cd ~/repos/Olical/dotfiles
  git pull
  cd -

  nvim +AstroUpdate +qa
end
