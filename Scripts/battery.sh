#!/bin/bash

while true; do

    # Get acpi output
    acpi_output=$(acpi -b)

    if echo "$acpi_output" | grep -q 'Discharging'; then
        
        # Extract the battery percentage from the acpi output
        battery_percentage=$(echo "$acpi_output" | grep -oP 'Discharging, \K[0-9]+%')

        $ Extract time remaining from acpi output
        time_remaining=$(echo "$acpi_output" | grep -oP '[0-9]+:[0-9]{2}:[0-9]{2}(?= remaining)')

        clear
        echo "Battery: $battery_percentage"
        echo "Time: $time_remaining"
    else
        echo "Plugged in"
    fi

    sleep 5m

done
