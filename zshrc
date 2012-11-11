HISTFILE=~/.histfile
<<<<<<< HEAD
HISTSIZE=1000
SAVEHIST=1
=======
HISTSIZE=1
SAVEHIST=0

#Remining me to do stuff
task
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d

# Options {{{
setopt appendhistory 
setopt autocd
setopt correct
setopt completealiases
setopt noclobber
# }}}

zstyle :compinstall filename '/home/tnek/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

<<<<<<< HEAD
bindkey -v
export EDITOR='vim'
export BROWSER='firefox'
=======

bindkey -v
export EDITOR='vim'
export BROWSER='chromium'
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d

# Keybindings {{{
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
# }}}

# Aliases
<<<<<<< HEAD
alias alsi='alsi -a'
alias cdwm='cd ~/.config/dwm && makepkg -g >> PKGBUILD && makepkg -eif'
alias dir="ls -lAhF"
alias dashify='ssh erkin@dashify.me'

#alias bar='bar --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# alias foo='sudo foo'
alias shutdown='sudo shutdown'
alias reboot='sudo reboot'
alias halt='sudo halt'
alias hamachi='sudo hamachi'
alias 'rc.d'='sudo rc.d'
=======
alias backup='cp ~/.Xdefaults ~/bin/Dropbox/Dotfiles/Xdefaults ; cp ~/.xinitrc ~/bin/Dropbox/Dotfiles/xinitrc ; cp -r ~/.irssi/* ~/bin/Dropbox/Dotfiles/irssi ; cp ~/.config/awesome/rc.lua ~/bin/Dropbox/Dotfiles/awesome/rc.lua ; cp ~/.zshrc ~/bin/Dropbox/Dotfiles/zshrc ; cp -r ~/.config/awesome/themes/* ~/bin/Dropbox/Dotfiles/awesome/ ; cp ~/.vimrc ~/bin/Dropbox/Dotfiles/vimrc ; cp -r ~/.ncmpcpp ~/bin/Dropbox/Dotfiles/ncmpcpp ; cp -r ~/.mpd/* ~/bin/Dropbox/Dotfiles/ncmpcpp/mpd ; cp -r ~/.config/luakit ~/bin/Dropbox/Dotfiles/luakit ; cp -r ~/.config/wmfs ~/bin/Dropbox/Dotfiles ; cp -r ~/.config/xfce4 ~/bin/Dropbox/Dotfiles/xfce4 ; cp -r ~/.config/xfce4-session ~/bin/Dropbox/Dotfiles/xfce4-session ; cp -r ~/.config/dwm ~/bin/Dropbox/Dotfiles/dwm'
alias cdwm='cd ~/.config/dwm && makepkg -g >> PKGBUILD && makepkg -eif'
alias alsi='alsi -a'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir="ls -lAhF"
alias update='yaourt -Syua'
alias dashify='ssh erkin@dashify.me'
alias unmute='xset b 50 250 50'
alias histclear='rm ~/.local/share/luakit/history.db'

# Shutdown
alias shutdown='sudo shutdown'
alias reboot='sudo reboot'
alias halt='sudo halt'
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d

# Verbose Commands
alias mkdir='mkdir -p -v'
alias rm='rm -I'
alias mv='mv -v'
alias cp='cp -v'

<<<<<<< HEAD
=======

>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d
autoload -Uz compinit
compinit
PS1=$'%{\e[1;30m%}[%{\e[0m%} %{\e[1;39m%}%~%{\e[0m%}%{\e[1;30m%}]%{\e[0m%}%{\e[0;34m%}$%{\e[0m%} '

##Coloring man pages
man() {
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

# Extract script
extr(){
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
<<<<<<< HEAD
            *.7z)           7z e $1       ;;
=======
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d
            *)              echo "'$1' cannot be extracted via extr()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Automatically doing 'ls' after a cd
cd() {builtin cd $@; ls }

<<<<<<< HEAD


=======
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d
