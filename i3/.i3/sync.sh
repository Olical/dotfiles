#!/usr/bin/env bash

yaourt -S parcellite wicd wicd-gtk redshift pa-applet-git feh imagemagick playerctl

BGS=~/.i3/backgrounds

if [ -d $BGS ]; then
    rm -r $BGS
fi

mkdir $BGS

curl http://p1.pichost.me/i/17/1400301.png -o $BGS/arch.png

curl http://subtlepatterns.com/patterns/dark_embroidery.zip -o $BGS/dark_embroidery.zip
cd $BGS
unzip dark_embroidery.zip
