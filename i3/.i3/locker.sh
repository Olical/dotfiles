#!/usr/bin/env bash

if [[ -z "$(pidof i3lock)" ]]; then
  i3lock -n -i ~/.i3/backgrounds/sloth.png --tiling &
else
  echo "i3lock is already running"
fi
