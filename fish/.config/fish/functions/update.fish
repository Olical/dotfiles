function update
  cd ~/dotfiles; git pull; cd -

  if [ (which yaourt) ]
    yaourt -Syua --noconfirm
    yaourt -C
  else if [ (which pacman) ]
    sudo pacman -Syu --noconfirm
    sudo pacdiff
  else if [ (which apt-get) ]
    sudo apt-get update; and sudo apt-get upgrade
  else if [ (which brew) ]
    brew update; and brew upgrade
  end

  for package in (npm -g outdated --parseable --depth=0 | grep -v "@git\|@linked" | cut -d: -f2)
    npm -g install "$package"
  end

  ~/.config/nvim/sync.sh
end
