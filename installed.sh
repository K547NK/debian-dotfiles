#!bin/bash
echo "You have installed" && dpkg --list | wc --lines && echo "Packages" &&
echo "rebooting now" && cd && rm -rf dotfiles

gpg --full-gen-key &&
pass init nigel.agwah@gmail.com &&
mw add &&
reboot 

