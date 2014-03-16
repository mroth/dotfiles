#
# global environment settings/variables
#
export GIT_EDITOR='vim'
export HOMEBREW_EDITOR='subl -n'
export CLICOLOR=1

#
# add local bin to default path
# (in theory this should be in default path on Mavericks, not sure why not on mbair?)
#
export PATH=/usr/local/bin:$PATH

#
# add local repo binstubs to default path
#
export PATH=.bundle/binstubs:$PATH

#
# set some convenience variables for things I can never remember where they are
#
export ST2CONFIG="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"
