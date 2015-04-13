#
# recursively touch, e.g. touch + mkdir -p
# so files can easily be created at depth
#
canhaz () {
  mkdir -p -- "${1%/*}" && touch -- "$1"
}

# make current shell setup for Khan Academy development
khanify () {
  # source virtualenv
  source ~/.virtualenv/khan27/bin/activate

  # override standard Git user info
  export GIT_AUTHOR_EMAIL=mroth@khanacademy.org
  export GIT_COMMITTER_EMAIL=mroth@khanacademy.org

  # Add Phabricator bins to PATH
  export PATH="$HOME/src/khan/devtools/arcanist/khan-bin:$PATH"
  # Add git-bigfiles to PATH
  export PATH="$HOME/src/khan/devtools/git-bigfile/bin:$PATH"
  # Add frankenserver bins to PATH
  export PATH="$HOME/src/khan/webapp/third_party/frankenserver:$PATH"
  # Add dotfiles scripts to PATH
  export PATH="$HOME/src/khan/devtools/khan-dotfiles/bin:$PATH"
}
