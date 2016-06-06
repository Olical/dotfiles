function maintenance
  echo "Failed systemd services..."
  sudo systemctl --failed

  echo "Errors in logfiles..."
  sudo journalctl -p 3 -xb --no-pager

  echo "Removing orphan packages..."
  sudo pacman -Rns (pacman -Qtdq)

  echo "Clear pacman cache..."
  sudo paccache -r
  sudo paccache -ruk0
end
