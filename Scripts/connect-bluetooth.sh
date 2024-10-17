#!/bin/bash

line="-----------------------------------------------------------------"

echo $line
echo ""
echo "Connecting to bluetooth..."
echo ""
echo $line
echo ""

status=$(rfkill list bluetooth | grep -i "Soft blocked" | awk '{print $3}' | head -n 1)

if [[ $status == "yes" ]]; then
    rfkill unblock bluetooth
fi

sleep 2s

bluetoothctl agent on

bluetoothctl power on

bluetoothctl connect 84:0F:2A:9A:09:11

cd

sleep 2s

echo ""
echo $line
echo ""
echo "Connected to Oppo EarBuds..."
echo ""
echo $line
echo ""

