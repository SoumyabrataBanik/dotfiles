#!/bin/bash

for dir in *; do
    if [[ -d $dir ]] && [[ $dir != "wallpapers" ]] && [[ $dir != "stow.sh" ]]; then
        stow $dir
    fi
done
