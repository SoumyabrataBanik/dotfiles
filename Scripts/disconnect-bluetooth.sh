#!/bin/bash

line="-----------------------------------------------------"

echo $line
echo ""
echo "Disconnecting Oppo Earbuds..."
echo ""
echo $line

sleep 2s

bluetoothctl disconnect 84:0F:2A:9A:09:11

cd /home/soumyabrata/

sleep 2s

echo ""
echo $line
echo ""
echo "Disconnected successfully..."
echo ""
echo $line
echo ""
