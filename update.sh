#!/usr/bin/env bash

for script in $(ls */update.sh)
do
    ./$script
done