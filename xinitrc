#!/bin/sh
##Set the wallpaper
#feh --bg-scale /home/tnek/pic/wallpapers/Aurora/dark.jpg
xsetroot -bg \#151515 -mod 3 3

#: Startup Programs
xflux -z 20874
urxvtd -o -q -f &
mpd &
autocutsel &
transmission-qt -m &
#if [ $? -ne 0 ]; then
#  mpdscribble &
#fi

#: System beep
#xset b 50 250 50
xset -b

#: Mouse
xset +dpms

### Window Manager 
#: Piping status to dwm statusbar
while true; do
    xsetroot -name  "| $(date +"%a, %b %d %r |")"
    sleep 1s    # Update time every second
done &

DEFAULT_SESSION=dwm

case $1 in
dwm)
	exec ck-launch-session dbus-launch dwm
	;;
*)
	exec ck-launch-session dbus-launch $DEFAULT_SESSION
	;;
esac
