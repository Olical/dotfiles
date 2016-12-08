default: add-repositories install-packages enable-services link-config set-shell spacemacs sync-neovim show-notes

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
	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	sudo systemctl disable systemd-rfkill
	sudo tlp start

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`

spacemacs:
	git clone git@github.com:syl20bnr/spacemacs.git ~/.emacs.d

sync-neovim:
	./neovim/.config/nvim/sync.sh

show-notes:
	cat ./post-install.txt
