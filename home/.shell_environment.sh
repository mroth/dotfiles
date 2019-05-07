#!/bin/sh

#
# global environment settings/variables
#
export EDITOR='vim'
export GIT_EDITOR='vim'
export HOMEBREW_EDITOR='vim'
export CLICOLOR=1

#
# some things about Go are really annoying
# set required GOPATH, add `go install` bin directory to default path (but make
# it last so /usr/local et al take precedence), and set a convenience env var
# to make it less annoying to navigate to my Go code src.
#
export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH/bin
export GOCODE=$GOPATH/src/github.com/mroth

#
# and now rust wants to have its own path as well (kinda, way less annoying tho)
#
export PATH="$HOME/.cargo/bin:$PATH"

#
# lolcommits related prefs
#
export LOLCOMMITS_DELAY=1

#
# Bundler: add local repo binstubs to default path
#
export PATH=.bundle/binstubs:$PATH

#
# Python, you make a big mess with your *.pyc bullshit.
#
export PYTHONDONTWRITEBYTECODE=1

#
# set some convenience variables for things I can never remember where they are
#
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"
export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

