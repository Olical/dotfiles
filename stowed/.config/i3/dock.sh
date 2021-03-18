#!/usr/bin/env bash

xrandr --output eDP-1 --off # Built in
xrandr --output DP-1-3 --off # BenQ
xrandr --output DP-1-1 --off # Samsung

if xrandr | grep "DP-1-3 connected"; then
  xrandr --output DP-1-3 --mode 1920x1080 --primary
  xrandr --output DP-1-1 --mode 1920x1080 --right-of DP-1-3
else
  xrandr --output eDP-1 --mode 1920x1080 --primary
fi

feh --bg-scale ~/.config/i3/background-image
