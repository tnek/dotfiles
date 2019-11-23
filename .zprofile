export PATH="/snap/bin:$PATH"
export GOPATH="$HOME/doc/gopath"
export PATH="${PATH}:${HOME}/.local/bin/:$GOPATH/bin"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   startx
fi
