#!/usr/bin/env bash

yaourt -S parcellite wicd wicd-gtk redshift pa-applet-git feh imagemagick playerctl

BGS=~/.i3/backgrounds

if [ -d $BGS ]; then
    rm -r $BGS
fi

mkdir $BGS

curl http://oli.me.uk/wp-content/uploads/2015/03/very-angular.png -o $BGS/desktop.png
curl http://oli.me.uk/wp-content/uploads/2015/03/dark-sharp-edges.png -o $BGS/lock.png
