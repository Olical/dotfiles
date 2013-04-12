#!/bin/bash

echo "Checking for Vundle..."
if [ ! -f ~/.vim/bundle/vundle/README.md ];
then
	echo "Vundle not found, installing..."
	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
else
	echo "Vundle found."
fi

echo "Removing, updating and installing bundles..."
vim +BundleClean! +BundleInstall! +qall
echo "All synced!"
