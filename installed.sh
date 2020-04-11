#!bin/bash
echo "You have installed" && dpkg --list | wc --lines && echo "Packages" &&
echo "rebooting now" && cd && rm -rf dotfiles
sudo reboot
