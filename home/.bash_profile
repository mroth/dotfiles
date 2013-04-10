# bash profile is executed for login shells
# we include .bashrc, so this is basically stuff that should only be run once
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#we just have a stub here so we can have one profile for bash/zsh
source $HOME/.profile
