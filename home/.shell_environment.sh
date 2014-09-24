#
# global environment settings/variables
#
export GIT_EDITOR='vim'
export HOMEBREW_EDITOR='subl -n'
export CLICOLOR=1

#
# some things about Go are really annoying
#
export GOPATH=$HOME/Dropbox/src/gocode

#
# Manually set Atom editor path
# (atom-cli sometimes complains without this when combined with homebrew-cask)
#
export ATOM_PATH=/opt/homebrew-cask/Caskroom/atom/latest/

#
# lolcommits related prefs
#
export LOLCOMMITS_DELAY=1

#
# add local repo binstubs to default path
#
export PATH=.bundle/binstubs:$PATH

#
# set some convenience variables for things I can never remember where they are
#
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"
