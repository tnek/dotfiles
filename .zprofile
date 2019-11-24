export PATH="/snap/bin:$PATH"
export GOPATH="$HOME/doc/gopath"
export EDITOR='vim'
export PATH="${PATH}:${HOME}/.local/bin/:$GOPATH/bin"
export PATH="${PATH}:${HOME}/.node_modules/bin"
export npm_config_prefix="$HOME/.node_modules"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   startx
fi
