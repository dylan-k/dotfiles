# .bash_profile runs on login shells, like the one at startup
# .bashrc is where i keep all my custom stuff. it's sourced below.
if [ "$BASH" ] && [ -r ~/.bashrc ]; then . ~/.bashrc; fi

# disable touchpad while typing
# source: https://www.computercorrect.com/2012/operating-systems/linux/xubuntu/configure-disable-touchpad-while-typing-delay/
syndaemon -i .5 -K -t -R -d

# During bootup login, start the X11 Graphical Environment
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
