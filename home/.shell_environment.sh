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
export ST2CONFIG="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"

#
# set ARCHFLAGS until ruby/xcode 5.1.1 bug is figured out
#
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future
