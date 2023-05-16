export TERMINAL="XTerm"
[[ -e ~/.Xresources ]] && xrdb ~/.Xresources
alias open="xdg-open"
exec i3
