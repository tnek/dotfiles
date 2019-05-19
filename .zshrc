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

bindkey -v

bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

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

# Coloring man pages
man()
{
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;37m") \
		LESS_TERMCAP_md=$(printf "\e[1;37m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[0;36m") \
			man "$@"
}

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
export IDAPATH="/Applications/IDA Pro 7.0/ida64.app/Contents/MacOS"
export PATH="${PATH}:${HOME}/.local/bin/:$GOPATH/bin"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export TERM=xterm-256color
alias gohome="cd $GOPATH"
alias blaze='bazel'
