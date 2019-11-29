#!/bin/sh
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xrdb ~/.Xresources
nm-applet &
redshift -l geoclue2 -t 5700:3600 &
urxvtd -q -o -f
libinput-gestures-setup start &
compton --config ~/.config/compton/compton.conf &
~/.fehbg &
exec dbus-launch --sh-syntax --exit-with-session i3
