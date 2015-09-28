function update
  pushd ~/dotfiles
  git pull

  if [ (which yaourt) ]
    yaourt -Syua --noconfirm
  else if [ (which pacman) ]
    sudo pacman -Syu --noconfirm
  else if [ (which apt-get) ]
    sudo apt-get update; and sudo apt-get upgrade
  else if [ (which brew) ]
    brew update; and brew upgrade
  end

  for package in (npm -g outdated --parseable --depth=0 | cut -d: -f2)
    if [ "$package" != "npm" ]
      npm -g install "$package"
    end
  end

  ./vim/.vim/sync.sh
  popd
end
