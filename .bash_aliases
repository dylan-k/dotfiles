# DYLAN'S ALIAS DEFINITIONS
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them to profile directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
# include this in .bashrc or .bash_profile like so:
# 
#     if [ -f ~/.bash_aliases ]; then
#         . ~/.bash_aliases
#     fi
# 
# ... and then bash yr brains out lolol



# COMMANDS
###############################################################################

alias open="xdg-open"
alias flatten="find ./ -mindepth 999 -type f -exec mv -i '{}' . \;"
alias noempty="find . -type d -print | xargs rmdir 2>/dev/null && find . -type d -print | xargs rmdir 2>/dev/null"
alias cleanup='echo "Cleaning Up" && sudo apt -f install && sudo apt autoremove && sudo apt -y autoclean && sudo apt -y clean'
alias update='sudo apt-get update; sudo apt-get upgrade; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# hard reset local git to match server's latest
alias overwrite="git fetch; git reset --hard origin/master"

# update git repo and then open in editor
alias workspace="git stash; git fetch --all; git pop; git status; code ."




# SETTINGS
###############################################################################

alias valestyles="cd ~/.config/vale/ && git fetch --all && git submodule foreach git pull origin master && git status && open . && code . && code ~/.vale.ini"



# LAUNCHERS
###############################################################################

alias chrome="google-chrome"



# NAVIGATION
###############################################################################

alias home="cd ~/"
alias desktop="cd ~/Desktop"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias media="cd ~/Media"
alias projects="cd ~/Projects"
alias sites="cd ~/Sites"
alias assets="cd ~/Assets"
alias notes="cd ~/Notes"

alias root="cd /"
alias up="cd ../"
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias up6="cd ../../../../../.."
alias up7="cd ../../../../../../.."
alias up8="cd ../../../../../../../.."
alias up9="cd ../../../../../../../../.."
alias up10="cd ../../../../../../../../../.."

# PROJECTS
###############################################################################

alias blog='cd ~/Sites/nocategories/ && git fetch && git status && code .'
alias recipes="cd ~/Documents/Home/recipes && git fetch &&  git status && open . && code ."






# Always use color output for `ls`
alias ls="command ls ${colorflag}"
alias dotfiles='git --git-dir=/home/dylan/.dotfiles/ --work-tree=/home/dylan'
