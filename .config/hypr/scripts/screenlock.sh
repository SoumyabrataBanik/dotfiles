#!/usr/bin/env bash

TEMP_DIR=/tmp/lockscreen
TEMP_FILE=lockscreen.png

mkdir -p $TEMP_DIR

hyprshot -s -m output -m eDP-1 -o $TEMP_DIR -f $TEMP_FILE

sleep 0.5s

hyprlock
