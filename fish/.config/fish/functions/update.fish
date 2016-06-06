function update
  cd ~/dotfiles; git pull; cd -

  yaourt -Syua --noconfirm
  yaourt -C

  for package in (npm -g outdated --parseable --depth=0 | grep -v "@git\|@linked" | cut -d: -f2)
    npm -g install "$package"
  end

  ~/.config/nvim/sync.sh

  maintenance
end
