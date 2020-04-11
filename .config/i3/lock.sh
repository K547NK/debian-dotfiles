#!bin/zsh
scrot ~/.config/i3/lock.png &&
convert ~/.config/i3/lock.png -blur 8x8 ~/.config/i3/lock.png &&
i3lock -i ~/.config/i3/lock.png
