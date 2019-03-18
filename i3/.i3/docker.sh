#!/usr/bin/env bash

IN="eDP-1"
EXT="DP-1"

xrandr > /dev/null
xrandr | grep "$EXT disconnected" > /dev/null

if [ $? -eq 0 ]; then
  xrandr --output $IN --primary --mode 1920x1080 --output $EXT --off
  xmodmap -e "pointer = 1 2 3" 2> /dev/null
  echo "-> Laptop mode"
else
  xrandr --output $IN --mode 1920x1080 --output $EXT --primary --mode 1920x1080 --right-of $IN
  xmodmap -e "pointer = 3 2 1" 2> /dev/null
  echo "-> Desktop mode"
fi
