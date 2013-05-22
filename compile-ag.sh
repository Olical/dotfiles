#!/bin/bash

if [ ! -d builds ];
then
	mkdir builds
fi

cd builds

if [ ! -d the_silver_searcher ];
then
	git clone https://github.com/ggreer/the_silver_searcher
	cd the_silver_searcher
else
	cd the_silver_searcher
	make clean
	git pull
fi

sudo apt-get install automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev && ./build.sh