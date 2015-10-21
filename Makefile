default: install-packages link-config set-shell sync-vim cleanup

install-packages: add-repositories
	sudo pacman -Sy yaourt termite infinality-bundle
	yaourt -S --needed --noconfirm `cat packages.txt`

add-repositories: add-infinality-key
	cat repositories.txt | sudo tee -a /etc/pacman.conf

add-infinality-key:
	sudo dirmngr &
	sleep 1
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`

sync-vim:
	./vim/.vim/sync.sh
	python2 ./vim/.vim/plugged/YouCompleteMe/install.py

cleanup:
	sudo systemctl disable xfce4-notifyd
	yaourt -Rs xfce4-notifyd
