#!/usr/bin/env bash

killall i3lock
i3lock -i ~/.i3/backgrounds/congruent_outline.png --tiling && sleep 1
sleep 60; pgrep i3lock && xset dpms force off
