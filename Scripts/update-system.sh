line="--------------------------------------------------------------------------"

echo $line
echo ""
echo "Updating System Packages"
echo ""
echo $line

sleep 5s
sudo pacman -Syu

echo ""
echo $line
echo ""
echo "System updated successfully..."
echo ""
echo $line
echo ""
echo "Powering off..."
echo ""
echo $line
echo ""

sleep 5s
sudo /sbin/poweroff
