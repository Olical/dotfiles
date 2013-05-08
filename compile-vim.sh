#!/bin/bash

if [ ! -d builds ];
then
	mkdir builds
fi

cd builds

if [ ! -d vim ];
then
	hg clone http://hg.debian.org/hg/pkg-vim/vim
	cd vim
else
	cd vim
	make clean
	hg pull
	hg update
fi

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev && ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp && make