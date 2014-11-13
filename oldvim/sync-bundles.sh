#!/bin/bash

echo "Checking for Vundle..."
if [ ! -f ~/.vim/bundle/Vundle.vim/README.md ];
then
	echo "Vundle not found, installing..."
	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
else
	echo "Vundle found."
fi

function update_modules {
	echo -e "\t$1..."
	pushd ./bundle/$1
	npm install
	npm update
	popd
}

function compile_module {
	echo -e "\t$1..."
	pushd ./bundle/$1
	if [[ -n $2 ]]
	then
		make -f $2
	else
		make
	fi
	popd
}

echo "Removing, updating and installing bundles..."
vim +PluginClean! +PluginInstall! +qall
echo "Updating NPM modules..."
update_modules tern_for_vim
echo "All synced!"
