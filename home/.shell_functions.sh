#
# recursively touch, e.g. touch + mkdir -p
# so files can easily be created at depth
#
canhaz () {
  mkdir -p -- "${1%/*}" && touch -- "$1"
}

#
# convenience functions for updating my shit
#
config_pull () {
  #TODO: pull dotfiles
  #pull sublime config
  config_sublime_pull
}

config_sublime_pull () {
  cd $ST2CONFIG
  git pull
  cd -
}
