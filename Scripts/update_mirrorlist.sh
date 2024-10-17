#!/bin/bash

echo "------------------------------------------------------------"
echo "Updating mirrorlist"
echo ""
echo "Synchronizing pacman"
sudo pacman -Syyy
echo "Pacman synchronized"
echo "Reflector started"
sudo reflector --country "India,Singapore,Japan,Thailand" --age 6 --sort rate --save /etc/pacman.d/mirrorlist 
echo "Reflector finished"
echo "Synchronizing pacman"
sudo pacman -Syyy
echo "Pacman synchronized"
echo "Mirrorlist updated"
echo "------------------------------------------------------------"

cd ~/
