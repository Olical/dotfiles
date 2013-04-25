#!/bin/bash

mkdir builds
cd builds
hg clone http://hg.debian.org/hg/pkg-vim/vim
cd vim
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp && make