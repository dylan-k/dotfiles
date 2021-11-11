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
###############################################################################



# COMMANDS
###############################################################################

alias open="xdg-open"

alias flatten="find ./ -mindepth 999 -type f -exec mv -i '{}' . \;"

alias noempty="find . -type d -print | xargs rmdir 2>/dev/null && find . -type d -print | xargs rmdir 2>/dev/null"

# find something in your history by typing `gh something`
alias gh='history|grep'

# update git repo and then open in editor
workspace() {
  echo "fetching updates..."
  git fetch && 
  echo "staashing local changes..."
  git stash save --include-untracked && 
  echo "pulling local changes..."
  git pull && 
  echo "checking local changes..."
  git stash pop && 
  git status && 
  code .
}

# hard reset local git to match server's latest
alias overwrite="git fetch; git reset --hard"

#tidy all the things
alias cleanup='echo "Cleaning Up" && sudo apt -f install && sudo apt autoremove && sudo apt -y autoclean && sudo apt -y clean'

# Update all the things
alias update='sudo apt-get update; sudo apt-get upgrade; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'



# NAVIGATION
###############################################################################

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

alias home="cd ~/"
alias desktop="cd ~/Desktop"
alias documents="cd ~/Documents"
alias downloads="cd ~/Downloads"
alias media="cd ~/Media"
alias projects="cd ~/Projects"
alias sites="cd ~/Sites"
alias assets="cd ~/Assets"
alias notes="cd ~/Notes && workspace"

# PROJECTS
alias journal='cd ~/Journal && workspace.'
alias blog='cd ~/Sites/nocategories/ && workspace'
alias poems='cd ~/Creative/poetry/poems && workspace'
alias chapbook='cd /home/dylan/Projects/2019-interjecterruptions && workspace'
alias iyengarnyc="cd ~/Sites/iyengarnyc/ && workspace."
alias recipes="cd ~/Documents/Home/recipes && workspace"


# SETTINGS
###############################################################################

#send git commands to headless dotfiles repo like `dotfiles status`
alias dotfiles='git --git-dir=/home/dylan/.dotfiles/ --work-tree=/home/dylan'

alias valestyles="cd ~/.config/vale/ && git fetch --all && git submodule foreach git pull origin master && git status && open . && subl . && subl ~/.vale.ini"

alias editgit='code ~/.gitconfig'
alias editbash='code ~/.bash_profile'
alias resource='source ~/.bash_profile && echo "Done!"'


# LAUNCHERS
###############################################################################

alias chrome="google-chrome"




# DETECT WHICH `LS` FLAVOR IS IN USE
###############################################################################
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
  export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
  colorflag="-G"
  export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"



