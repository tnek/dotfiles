HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1

setopt appendhistory
setopt autocd
setopt correct
setopt completealiases
setopt noclobber

zstyle :compinstall filename '/home/tnek/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select

# !! --color=auto
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Verbose Commands
alias mkdir='mkdir -p -v'
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'

autoload -Uz compinit
compinit

if [[ $(whoami) == 'root' ]]; then
    PS1=$'%{\e[1;30m%}[%{\e[0m%} %{\e[1;39m%}%~%{\e[0m%}%{\e[1;30m%}]%{\e[0m%}%{\e[0;31m%}#%{\e[0m%} '
else
    PS1=$'%{\e[1;30m%}[%{\e[0m%} %{\e[1;39m%}%~%{\e[0m%}%{\e[1;30m%}]%{\e[0m%}%{\e[0;34m%}$%{\e[0m%} '
fi

extr()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.xz)       tar xvJf $1   ;;
            *.tar.bz2)      tar xvjf $1   ;;
            *.tar.gz)       tar xvzf $1   ;;
            *.bz2)          bunzip2 $1    ;;
            *.rar)          unrar x $1    ;;
            *.gz)           gunzip $1     ;;
            *.tar)          tar xvf $1    ;;
            *.tbz2)         tar xvjf $1   ;;
            *.txz)          tar xvJf $1   ;;
            *.tgz)          tar xvzf $1   ;;
            *.rar)          unrar $1      ;;
            *.zip)          unzip $1      ;;
            *.Z)            uncompress $1 ;;
            *.7z)           7z e $1       ;;
            *)              echo "'$1' cannot be extracted via extr()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

cd() {builtin cd $@; ls -G}

export GOPATH="$HOME/doc/gopath"
export PATH="${PATH}:/snap/bin"
export PATH="${PATH}:${HOME}/.local/bin/:$GOPATH/bin"
alias gh="cd $GOPATH/src"

export PATH="${PATH}:${HOME}/.node_modules/bin"
export npm_config_prefix="$HOME/.node_modules"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export TERM=xterm-256color
