#!/usr/bin/env bash

pgrep i3lock && exit 0

i3lock -i ~/.i3/backgrounds/congruent_outline.png --tiling && sleep 1
sleep 60; pgrep i3lock && xset dpms force off
