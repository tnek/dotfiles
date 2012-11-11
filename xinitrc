#!/bin/sh

##Set the wallpaper
feh --bg-scale /home/tnek/pic/wallpapers/Anime/SAO/fort.jpg
#xsetroot -bg \#151515 -mod 3 3

mpd &
xflux -z 20874
autocutsel &
#transmission-qt &

#if [ $? -ne 0 ]; then
#  mpdscribble &
#fi


##DWM Statusbar shit
# MPD Widget
getMpd() {
   if [ "`mpc | grep playing | awk '{ print $2 }' | wc -l`" != 1 ]; then
      echo -ne "Music Paused"
   else
      if [ `mpc | grep playing | awk '{ print $4 }' | sed 's/.\(.*\)/\1/' | sed 's/\(.*\)../\1/'` = 100 ]; then
         echo -ne "`mpc | head -n 1 |cut -c 1-200`"
         mpc_time="`mpc | grep playing | awk '{ print $3 }'`"
         echo -ne " \x06[$mpc_time]"
   else
         echo -ne "`mpc | head -n 1 |cut -c 1-200`"
         mpc_time="`mpc | grep playing | awk '{ print $3 }'`"
         echo -ne " [$mpc_time]"
      fi
   fi
}


# Piping status to statusbar
while true; do
    xsetroot -name  "| $(getMpd) | $(date +"%a, %b %d %r |")"
   sleep 1s    # Update time every second
done &

# Urxvt Daemon
urxvtd -o -q -f &

##Other shit
# System beep
#xset b 50 250 50
xset -b
# Mouse
xset +dpms
# Setting cursor theme
#xsetroot -cursor_name left_ptr

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

DEFAULT_SESSION=dwm

case $1 in
dwm)
	exec ck-launch-session dbus-launch dwm
	;;
*)
	exec ck-launch-session $DEFAULT_SESSION
	;;
esac
