#
# global environment settings/variables
#
export EDITOR='vim'
export GIT_EDITOR='vim'
export HOMEBREW_EDITOR='atom -n'
export CLICOLOR=1

#
# some things about Go are really annoying
#
export GOPATH=$HOME/src/go
export PATH=$GOPATH/bin:$PATH
export GOCODE=$GOPATH/src/github.com/mroth

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
