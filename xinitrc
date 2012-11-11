<<<<<<< HEAD
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

=======

##Stuff awesome already does

##Set the wallpaper
# Simple Wallpaper
#xsetroot -bg \#121212 -mod 10 10
# Blue Wallpaper
#feh --bg-scale /home/tnek/pic/walls/detail/city.jpg
# RD Wallpaper
feh --bg-scale /home/tnek/pic/walls/MLP/Rainbow/rd.png

mpd &
#xcompmgr -CcfF -I-.02 -O-.04 -D0001 -t-5 -l-5 -r4.2 -o.82 &
autocutsel -selection PRIMARY -fork &
xflux -z 20874
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d

##DWM Statusbar shit
# MPD Widget
getMpd() {
<<<<<<< HEAD
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
=======

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
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d
}


# Piping status to statusbar
while true; do
    xsetroot -name  "| $(getMpd) | $(date +"%a, %b %d %r |")"
   sleep 1s    # Update time every second
done &

<<<<<<< HEAD
# Urxvt Daemon
urxvtd -o -q -f &
=======


# Urxvt Daemon
urxvtd -o -q -f &
# hide cursor
unclutter -idle 1 -jitter 1 -noevents -root &
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d

##Other shit
# System beep
#xset b 50 250 50
xset -b
# Mouse
xset +dpms
<<<<<<< HEAD
# Setting cursor theme
#xsetroot -cursor_name left_ptr

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
=======
xset 0 0 300
#Setting cursor theme
# xsetroot -cursor_name left_ptr
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d

DEFAULT_SESSION=dwm

case $1 in
<<<<<<< HEAD
dwm)
	exec ck-launch-session dbus-launch dwm
	;;
*)
	exec ck-launch-session $DEFAULT_SESSION
=======
awesome)
	exec ck-launch-session awesome
	;;
dwm)
	exec ck-launch-session dwm
	;;
*)
	exec $DEFAULT_SESSION
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d
	;;
esac
