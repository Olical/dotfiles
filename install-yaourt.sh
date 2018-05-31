#!/usr/bin/env bash

set -xe

sudo pacman -Sy git
mkdir -p temp-yaourt-repos
cd temp-yaourt-repos
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ../..
rm -rf temp-yaourt-repos
