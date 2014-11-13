#!/usr/bin/env bash

for script in $(ls */install.sh)
do
    $script
done