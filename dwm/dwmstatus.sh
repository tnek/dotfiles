#!/bin/bash
#: Seperator to divide each value on the statusbar.
sep="-"

#: Gmail Mail Notifications
#: Will display the number if unread emails if there are any.
#: Set the directory for your login information for your email below:
login_dir=$HOME/.backup/login
#: At $login_dir, your information should be in the below format:
#:     username="your_username"
#:     password="your_password"
getEmail()
{
    if host mail.google.com &> /dev/null; then
        . $login_dir
        curl -s https://"$username":"$password"@mail.google.com/mail/feed/atom &> ${HOME}/.mailcache
        fullcount=$(awk -F '</?fullcount>' 'NF>1{print $2}' $HOME/.mailcache)
        if [[ "$fullcount" > '0' ]]; then
            echo -en "$sep Emails: $fullcount "
        else
            echo -en ""
        fi
    fi
}

#: MPD Now Playing Widget
#: If no song is playing, it will not display anything. As such, this should be 
#: accounted for when setting your statusbar.
getMpd()
{
    if [ "`mpc | sed '2q;d' | grep playing | wc -l`" != 1 ]; then
        echo -en ""
    else
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

#: DWM's statusbar is printed as the value of `xsetroot -name`
#: This is somewhat a hackish way of making a statusbar.
while true; do
    unread=$(getEmail)
    for i in {1..300}; do  # Update every 300 seconds, or every 5 minutes
        xsetroot -name  "${unread}$(getMpd)$sep $(getDate) $sep" 
        sleep 1s
    done
done &
