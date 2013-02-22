#!/bin/sh
xsetroot -bg \#151515 -mod 3 3
xset -b

#: Startup Programs
redshift -l 40:-80 &
urxvtd -o -q -f &
mpd &
autocutsel &
transmission-qt &
firefox &

#: Starting the Window Manager
exec dbus-launch --sh-syntax --exit-with-session $HOME/.startdwm
