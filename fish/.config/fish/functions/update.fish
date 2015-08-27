function update
  pushd ~/dotfiles
  git pull

  if [ (which yaourt) ]
    yaourt -Syua --noconfirm
  else if [ (which pacman) ]
    pacman -Syu --noconfirm
  else if [ (which brew) ]
    brew update; and brew upgrade
  end

  for package in (npm -g outdated --parseable --depth=0 | cut -d: -f2)
    npm -g install "$package"
  end

  ./vim/.vim/sync.sh
  popd
end
