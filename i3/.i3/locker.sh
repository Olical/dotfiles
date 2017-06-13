#!/usr/bin/env bash

if [[ -z "$(pidof i3lock)" ]]; then
  {
      killall compton
      i3lock -n -i ~/.i3/backgrounds/congruent_outline.png --tiling
      compton -b --config ~/.i3/compton.conf
  } &
else
  echo "i3lock is already running"
fi
