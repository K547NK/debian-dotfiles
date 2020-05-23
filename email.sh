#!/bin/sh

#dependencies for offline email
sudo apt install neomutt isync msmtp pass notmuch &&

#download mutt-wizard from remote repository
git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard
sudo make install

#set up email client do the rest by yourself
gpg --full-gen-key &&
pass init paesser0@gmail.com &&
mw add 
