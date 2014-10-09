#!/usr/bin/env bash

pushd ~/.emacs.d/el-get/

pushd tern
npm install
npm update
popd

pushd helm
make
popd

popd
