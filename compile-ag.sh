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

./build.sh