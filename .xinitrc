#!/bin/sh
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xrdb ~/.Xresources
redshift -l geoclue2 -t 5700:3600 &
urxvtd -q -o -f
libinput-gestures-setup start &
compton --config ~/.config/compton/compton.conf &
~/.fehbg &
nm-applet &
exec dbus-launch --sh-syntax i3
