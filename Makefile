default: install-yay install-packages enable-nm link-config set-shell sync-neovim show-notes

install-yay:
	./install-yay.sh

install-packages:
	yay -S --needed --noconfirm `cat packages.txt`

enable-nm:
	sudo systemctl enable NetworkManager
	sudo systemctl start NetworkManager

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`

sync-neovim:
	./neovim/.config/nvim/sync.sh

show-notes:
	cat ./post-install.txt
