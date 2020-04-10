#!/bin/bash
#create and a local user config folder and copy all settings to it
cp -r Manuals /home/nigel/
cp -r Pictures /home/nigel/
mkdir /home/nigel/.config && cp -r .config/* /home/nigel/.config/

#installing our fave programs and i3 gaps dependencies
apt install htop vim neofetch imagemagick i3blocks aptitude ardour font-manager sudo gcc make dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev ranger tlp sddm compton python3-pip xorg i3lock feh telegram-desktop firefox-esr rofi zsh curl -y

#make a directory for our sddm user icon and set permissions for sddm
mkdir -p /usr/share/sddm/faces && cp -r nigel.face.icon /usr/share/faces/

#cause we all love to be the occassional superuser
sudo adduser nigel sudo

#remove those annoying preinstalled tiny text editors
apt remove nano vim-tiny

#i hate to but i gots to install spotify for the music
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list

apt update && apt install spotify-client -y

#time for our favorite window manager
git clone https://github.com/resloved/i3.git

cd i3

# compile & install
autoreconf --force --install

rm -rf build/

mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers

make

make install

cd ..
#cause we all love zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#of course we love to have but not use powerline
pip3 install powerline-shell

#copy essential dotfiles to home folder
cp -r .vimrc /home/nigel/ && cp -r .Xresources /home/nigel/ && cp -r .zshrc /home/nigel/


rm -rf i3

