default: install-yay install-packages enable-services link-config set-shell install-clojure sync-neovim show-notes

install-yay:
	./install-yay.sh

install-packages:
	yay -S --needed --noconfirm `cat packages.txt`

enable-services:
	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	sudo systemctl disable systemd-rfkill
	sudo tlp start

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`

install-clojure:
	./install-clojure.sh

sync-neovim:
	./neovim/.config/nvim/sync.sh

show-notes:
	cat ./post-install.txt
