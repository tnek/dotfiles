export PATH="/snap/bin:$PATH"
export GOPATH="$HOME/doc/gopath"
export EDITOR='vim'
export PATH="${PATH}:${HOME}/.local/bin/:$GOPATH/bin"
export PATH="${PATH}:${HOME}/.node_modules/bin"
export npm_config_prefix="$HOME/.node_modules"

# Pretty tty colors
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   startx
fi
