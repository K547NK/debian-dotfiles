#!/bin/sh
#gey spotify from their mf servers
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
sudo echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

#this will copy nigel's user account  into your local machine
sudo apt update && sudo apt install spotify-client -y &&
cp -r ~/dotfiles/.config/spotify ~/.config/

