#!/bin/sh
xrdb ~/.Xresources
xsetroot -bg \#151515 -mod 3 3
xset -b
urxvtd -o -q -f &
mpd &
autocutsel &
transmission-qt &
firefox &
exec dbus-launch --sh-syntax --exit-with-session startdwm
