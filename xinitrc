#!/bin/sh
xrdb ~/.Xresources
xsetroot -bg \#151515 -mod 3 3
nm-applet &
redshift &
#xset -b
feh --bg-fill ~/Pictures/wallpapers/lulu.jpg 
exec dbus-launch --sh-syntax --exit-with-session i3
