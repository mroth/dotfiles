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
# lolcommits related prefs
#
export LOLCOMMITS_DELAY=1

#
# Bundler: add local repo binstubs to default path
#
export PATH=.bundle/binstubs:$PATH

#
# Bundler: configure BUNDLE_JOBS for concurrent installs.
# for details on why I set this the way I do, see:
# http://blog.mroth.info/blog/2014/10/02/rubygems-bundler-they-took-our-jobs/
#
if [[ "$OSTYPE" = darwin* ]]
then
  local target_jobs="$(expr `sysctl hw.physicalcpu | awk '{print $2}'` \* 2)"
else
  local target_jobs="$(nproc)"
fi
export BUNDLE_JOBS=$target_jobs

#
# Python, you make a big mess with your *.pyc bullshit.
#
export PYTHONDONTWRITEBYTECODE=1

#
# set some convenience variables for things I can never remember where they are
#
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"
export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

