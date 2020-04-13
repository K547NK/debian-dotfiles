#!/bin/bash
#create and a local user config folder and copy all settings to it


#installing our fave programs and i3 gaps dependencies
sudo apt install gcc make dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev  -y

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
