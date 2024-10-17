#!/bin/bash

check_plugged_in() {
    vari=$(cat /sys/class/power_supply/AC0/online)
    if [ $vari -eq 1 ]; then
        return 0
    else
        return 1
    fi
}

set_plugged() {
    if ! xset q | grep -q "DPMS is Disabled"; then
        xset s off
        xset s noblank
        xset -dpms
    fi
}

set_not_plugged() {
    if ! xset q | grep -q "DPMS is Enabled"; then
        xset s on
        xset s blank
        xset +dpms
    fi
}

while true; do
    if check_plugged_in; then
        set_plugged
    else
        set_not_plugged
    fi
    sleep 5s
done
