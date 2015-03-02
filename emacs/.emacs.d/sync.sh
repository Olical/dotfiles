#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
CASKDIR=$DIR/cask-repo
CASKBINDIR=$CASKDIR/bin

if [ ! -d $CASKDIR ]; then
    git clone git@github.com:cask/cask.git $CASKDIR
    echo "Cask was just downloaded. Add '$CASKBINDIR' to your path to access the executable."
fi

cd $DIR
$CASKBINDIR/cask install
$CASKBINDIR/cask upgrade-cask
$CASKBINDIR/cask update
