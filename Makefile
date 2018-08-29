default: install-yaourt install-packages enable-services link-config set-shell sync-neovim show-notes

install-yaourt:
	./install-yaourt.sh

install-packages:
	yaourt -S --needed --noconfirm `cat packages.txt`

enable-services:
	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	sudo systemctl disable systemd-rfkill
	sudo tlp start

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`

sync-neovim:
	./neovim/.config/nvim/sync.sh

show-notes:
	cat ./post-install.txt
