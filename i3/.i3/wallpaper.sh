#!/usr/bin/env bash

cd /tmp

while true; do
    rm -rf wallpapers
    subdown wallpapers

    for i in {1..5}; do
        feh --randomize --bg-max wallpapers/*
        sleep 1h
    done
done
