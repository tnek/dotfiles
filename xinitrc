
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
# hide cursor
unclutter -idle 1 -jitter 1 -noevents -root &

##Other shit
# System beep
#xset b 50 250 50
xset -b
# Mouse
xset +dpms
xset 0 0 300
#Setting cursor theme
# xsetroot -cursor_name left_ptr

DEFAULT_SESSION=dwm

case $1 in
awesome)
	exec ck-launch-session awesome
	;;
dwm)
	exec ck-launch-session dwm
	;;
*)
	exec $DEFAULT_SESSION
	;;
esac
