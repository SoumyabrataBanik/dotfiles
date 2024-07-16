#!/bin/bash

if [ ! -d "/tmp/screenlock" ]; then
    mkdir /tmp/screenlock
fi

if [ -f /tmp/screenlock/current.png ]; then
    rm /tmp/screenlock/current.png
fi

if [ -f /tmp/screenlock/blur.png ]; then
    rm /tmp/screenlock/blur.png
fi

if [ -f /tmp/screenlock/prelock.png ]; then
    rm /tmp/screenlock/prelock.png
fi

grim /tmp/screenlock/current.png

convert -scale 10% -blur 0x4 -resize 1000% /tmp/screenlock/current.png /tmp/screenlock/blur.png

composite -gravity center ~/dotfiles/wallpapers/overlay.png /tmp/screenlock/blur.png /tmp/screenlock/lock.png

hyprlock
