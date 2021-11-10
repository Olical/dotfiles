#!/usr/bin/env bash

CMD="xrandr --output"

# Built in
MAIN="eDP1"
MAINC="$CMD $MAIN"

# BenQ
DESK="DP1-3"
DESKC="$CMD $DESK"

# Samsung
DESK_ALT="DP1-1"
DESK_ALTC="$CMD $DESK_ALT"

if xrandr | grep "$DESK connected"; then
  $DESKC --mode 1920x1080 --primary
  $DESK_ALTC --mode 1920x1080 --right-of $DESK
  $MAINC --off
else
  $MAINC --mode 1920x1080 --primary
  $DESKC --off
  $DESK_ALTC --off
fi

feh --bg-scale ~/.config/i3/background-image
