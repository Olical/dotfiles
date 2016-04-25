default: add-repositories install-packages enable-services link-config set-shell sync-neovim

install-packages:
	sudo pacman -Sy yaourt
	yaourt -S --needed --noconfirm `cat packages.txt`

add-repositories: add-infinality-key
	cat repositories.txt | sudo tee -a /etc/pacman.conf

add-infinality-key:
	sudo dirmngr &
	sleep 1
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58

enable-services:
	sudo systemctl enable lightdm NetworkManager

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`

sync-neovim:
	./neovim/.config/nvim/sync.sh
