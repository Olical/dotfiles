function update-mirrorlist
  sudo reflector --protocol http --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist
end
