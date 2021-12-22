# .bash_profile runs on login shells, like the one at startup
# .bashrc is where i keep all my custom stuff. it's sourced below.
if [ "$BASH" ] && [ -r ~/.bashrc ]; then . ~/.bashrc; fi

# During bootup login, start the X11 Graphical Environment
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# settings for homebrew linux
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
