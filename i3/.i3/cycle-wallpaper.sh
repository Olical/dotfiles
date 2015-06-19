#!/usr/bin/env bash

while true; do
    ~/.i3/fetch-wallpapers.sh

    for i in {1..5}; do
        ~/.i3/select-wallpaper.sh
        sleep 1h
    done
done
