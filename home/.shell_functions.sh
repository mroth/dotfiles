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
