#!/bin/sh

# list dotfiles
alias lsd='ls -od \.*'

# homeshick as a pseudo command
alias homesick=homeshick

# my code todos
alias td='ack TODO'

# for obsessive version checking
alias brewsup='brew update && brew outdated'
alias brewup='brew upgrade && brew cleanup'

# since you have to type it so much
alias be='bundle exec'

# darwin specific
# add hidden airport CLI command
# since I'm noncommital just alias instead of polluting $PATH or symlinking
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
