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

scrot -t png /tmp/screenlock/current.png

convert -scale 10% -blur 0x4 -resize 1000% /tmp/screenlock/current.png /tmp/screenlock/blur.png

composite -gravity southeast ~/dotfiles/wallpapers/over.png /tmp/screenlock/blur.png /tmp/screenlock/lock.png

i3lock -i /tmp/screenlock/lock.png 
