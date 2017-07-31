#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

export BROWSER="chromium"

if [ -f ~/.xinitrc-local ]; then
  ~/.xinitrc-local
fi

exec i3
