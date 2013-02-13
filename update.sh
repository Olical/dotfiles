#!/bin/bash

vim +BundleUpdate +qall
pushd ~
rm -rf ycm_build
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/cpp
make ycm_core
popd