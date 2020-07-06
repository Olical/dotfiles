#!/usr/bin/env bash

if xrandr | grep "DP-1-3 connected"; then
  xrandr --output eDP-1 --mode 1920x1080
  xrandr --output DP-1-3 --mode 1920x1080 --left-of eDP-1 --primary
else
  xrandr --output eDP-1 --mode 1920x1080 --primary
  xrandr --output DP-1-3 --off
fi

feh --bg-scale ~/.config/i3/background-image
