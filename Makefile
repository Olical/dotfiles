default: install-yay install-packages link-config set-shell install-clojure sync-neovim show-notes

install-yay:
	./install-yay.sh

install-packages:
	yay -S --needed --noconfirm `cat packages.txt`

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
