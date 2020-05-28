#!/bin/sh

#install both display manager and server also add window manager and compositor
sudo pkg install bspwm sxhkd sddm compton feh lemonbar xorg scrot i3lock neofetch lynx vim feh zsh

#details
sudo echo "hald_enable="YES"" > /etc/rc.conf
sudo echo "dbus_enable="YES"" > /etc/rc.conf
sudo echo "sddm_enable="YES"" > /etc/rc.conf

#make directories for BSPWM and SXHKD
mkdir ~/.config && cp -r .config/* ~/.config/
mkdir -p ~/.config/bspwm && mkdir -p ~/.config/sxhkd
cp /usr/local/share/examples/bspwm/bspwmrc ~/.config/bspwm
cp /usr/local/share/examples/bspwm/sxhkdrc ~/.config/sxhkd
cp /etc/X11/xinit/xinitrc ~/.xinitrc

echo "sxhkd &" > ~/.xinitrc
echo "exec bspwm" > ~/.xinitrc

cp -r Manuals ~/
cp -r Pictures ~/
cp -r .vimrc ~/
cp -r .Xresources ~/

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
