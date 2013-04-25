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

./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp && make