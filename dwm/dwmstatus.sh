#!/bin/bash
###
#   Personal DWM Statusbar Script
#   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   :copyright: (C) 2012 by Kent Ma
#
###

#: Seperator to divide each value on the statusbar.
sep="-"

#: Set the directory for your login information for your email:
#: At $login_dir, your information should be in the below format:
#:     username="your_username"
#:     password="your_password"
login_dir=$HOME/.backup/login

#: Gmail Mail Notifications
#: Will display the number if unread emails if there are any.
getEmail()
{
    if host mail.google.com &> /dev/null; then
        . $login_dir
        fullcount=$(curl -s https://"$username":"$password"@mail.google.com/mail/feed/atom | awk -F '</?fullcount>' 'NF>1{print $2}')
        if [[ "$fullcount" > '0' ]]; then
            echo -en "$sep Emails: $fullcount "
        fi
    fi
}

#: Wi-Fi information
#: Displays the currently connected network, and the signal strength.
#: Since this uses $ wicd-cli, obviously it only works if you're using wicd.
#: No network is shown if you aren't connected to a network.
getWifi()
{
    if [[ $(wicd-cli --wireless -d | grep Essid | wc -l) > 0 ]]; then
        essid=$(wicd-cli --wireless -d | grep Essid | sed 's/Essid\: //g')
        str=$(wicd-cli --wireless -d | grep Quality | sed 's/Quality\: //g')
        echo -ne "$sep Network: $essid: Strength: $str% "
    fi
}

#: MPD Now Playing Widget
#: If no song is playing, it will not display anything. As such, this should be 
#: accounted for when setting your statusbar..
getMpd()
{
    if [[ ! "`mpc | sed '2q;d' | grep playing | wc -l`" != 1 ]]; then
        mpctime="`mpc | sed '2q;d' | grep playing | awk '{ print $3 }'`"
        echo -en "$sep `mpc | head -1 | cut -c 1-200` [$mpctime] "
    fi
}

#: Date Widget
#: Formatted as:
#:     $DAY, $MONTH $DATE $TIME
getDate()
{
    echo -en $(date +"%a %b %d %r")
}

# DWM's statusbar is printed as the value of `xsetroot -name`
# This is somewhat a hackish way of making a statusbar.
while true; do
    # These two will update every minute instead of every second. 
    # Hackish way of creating this delay, there may be better methods.
    wifi=$(getWifi)
    email=$(getEmail)
    for i in {1..60}; do
        xsetroot -name "${email}$(getMpd)${wifi}$sep $(getDate) $sep" 
        sleep 1s
    done
done &
