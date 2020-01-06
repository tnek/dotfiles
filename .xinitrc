#!/bin/sh
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xrdb ~/.Xresources
redshift -r -l 40:-74 -t 5700:3700 &
urxvtd -q -o -f
libinput-gestures-setup start &
#picom --config ~/.config/compton/compton.conf &
~/.fehbg &
nm-applet &
exec dbus-launch --sh-syntax i3
