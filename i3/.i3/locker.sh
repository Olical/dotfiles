#!/usr/bin/env bash

if [[ -z "$(pidof i3lock)" ]]; then
  i3lock -i ~/.i3/backgrounds/congruent_outline.png --tiling && sleep 1
else
  echo "i3lock is already running"
fi
