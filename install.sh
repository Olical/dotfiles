#!/usr/bin/env bash

if [ ! -f .installed ]
then
    touch .installed
fi

for script in $(ls */install.sh)
do
    base=$(dirname $script)

    if ! grep -q $base .installed 
    then
        echo $base >> .installed
        ./$script
    fi
done
