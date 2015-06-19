#!/usr/bin/env bash

if ! type "i3lock-wrapper" > /dev/null; then
    i3lock -i ~/.i3/backgrounds/lock.png --tiling && sleep 1
else
    i3lock-wrapper && sleep 1
fi
