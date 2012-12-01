# bash profile is executed for login shells
# we include .bashrc, so this is basically stuff that should only be run once

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#
# Let this rvm shit live here instead of main configuration, 
# cuz rvm installer is annoying and re-adds them!
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
