#!bin/bash
echo "You have installed" && dpkg --list | wc --lines && echo "Packages"
echo "rebooting now"
reboot
