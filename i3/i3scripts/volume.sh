#/bin/bash
# Modified from https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a to work without dunstify
get_volume() {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

is_mute() {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

send_notification() {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume / 3)) | sed 's/[0-9]//g')
    # Send the notification
    notify-send -i audio-volume-muted-blocking -t $1 -u normal "    $bar"
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -D pulse set Master on > /dev/null
	# Up the volume (+ 5%)
	amixer -D pulse sset Master 5%+ > /dev/null
	send_notification 8
	;;
    down)
	amixer -D pulse set Master on > /dev/null
	amixer -D pulse sset Master 5%- > /dev/null
	send_notification 8
	;;
    mute)
    	# Toggle mute
	amixer -D pulse set Master 1+ toggle > /dev/null
	if is_mute ; then
	    notify-send -i audio-volume-muted -t 200 -u normal "Mute"
	else
	    send_notification 200
	fi
	;;
esac
