#!/bin/bash
#create and a local user config folder and copy all settings to it
#this adds a complete guide to Python Development and GNU Troff please comment out unnecessary lines
cp -r Manuals /home/nigel/
cp -r Pictures /home/nigel/
mkdir ~/.config && cp -r .config/* ~/.config/

#installing our fave programs and i3 gaps dependencies
sudo apt install xterm htop vim neofetch neomutt isync msmtp pass notmuch mupdf scrot imagemagick i3blocks aptitude ardour font-manager  gcc make dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev ranger tlp sddm compton python3-pip xorg i3lock feh telegram-desktop firefox-esr ark rofi zsh curl -y

#make a directory for our sddm user icon and set permissions for sddm replace you
#comment out this line you dont need it unless you want my face on your computer
sudo mkdir -p /usr/share/sddm/faces/ && sudo cp -r nigel.face.icon /usr/share/faces/

#remove those annoying preinstalled tiny text editors which are powerfull yet incomplete
sudo apt remove nano vim-tiny

#i hate to but i gots to install spotify for the music
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
sudo echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update && sudo apt install spotify-client -y

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

sudo make install

cd ..
#cause we all love zsh tthis will install oh-my-zsh and remove the one it file it adds
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#of course we love to have but not use powerline
#the customiztions is all left to you
sudo pip3 install powerline-shell

git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard
sudo make install
