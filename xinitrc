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

#: dwm settings
while true; do
    xsetroot -name  "| $(date +"%a, %b %d %r |")"
    sleep 1s    # Update time every second
done &
exec dbus-launch dwm
