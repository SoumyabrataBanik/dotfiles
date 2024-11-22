#!/bin/bash

# Check if power-profiles-daemon is installed
if ! command -v powerprofilesctl &> /dev/null; then
    echo "powerprofilesctl could not be found. Please install power-profiles-daemon."
    exit 1
fi

# Check if swaync is installed
if ! command -v swaync &> /dev/null; then
    echo "swaync could not be found. Please install swaync."
    exit 1
fi

# Function to change the power profile and notify
change_power_profile() {
    local profile=$1
    powerprofilesctl set $profile
    if [ $? -eq 0 ]; then
        notify-send -t 3000 "Power profile changed to $profile"
    else
        notify-send -t 3000 "Failed to change power profile to $profile"
    fi
}

# Toggle between power profiles
current_profile=$(powerprofilesctl get)

case $current_profile in
    balanced)
        change_power_profile power-saver
        ;;
    power-saver)
        change_power_profile balanced
        ;;
    *)
        send_notification "Unknown power profile: $current_profile"
        ;;
esac
