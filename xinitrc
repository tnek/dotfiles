#!/bin/sh
autocutsel -fork 
autocutsel -selection PRIMARY -fork
xrdb ~/.Xresources
nm-applet &
redshift &
#xset -b
#xsetroot -bg \#151515 -mod 3 3
feh --bg-fill ~/pic/wallpapers/cur_wallpaper.jpg
exec dbus-launch --sh-syntax --exit-with-session i3
