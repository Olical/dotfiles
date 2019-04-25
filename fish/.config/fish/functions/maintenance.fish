function maintenance
  echo "Failed systemd services..."
  sudo systemctl --failed

  echo "Recent errors in logfiles (journalctl -p 3 -xb)..."
  sudo journalctl -p 3 -xb --no-pager | tail -15

  echo "Removing orphan packages..."
  sudo pacman -Rns (pacman -Qtdq)

  echo "Clear pacman cache..."
  sudo paccache -r
  sudo paccache -ruk0
end
