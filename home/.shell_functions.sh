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

  # Add frankenserver bins to PATH (I never refer to these directly..)
  # export PATH="$HOME/src/khan/webapp/third_party/frankenserver:$PATH"

  # Add devtools bins to PATH
  KA_DEVROOT="$HOME/src/khan/devtools"
  export PATH="$KA_DEVROOT/arcanist/khan-bin:$PATH"
  # everything below I globally handle via homebrew for now...
  # export PATH="$KA_DEVROOT/git-bigfile/bin:$PATH"
  # export PATH="$KA_DEVROOT/git-workflow/bin:$PATH"
  # export PATH="$KA_DEVROOT/ka-clone/bin:$PATH"
  # export PATH="$KA_DEVROOT/khan-linter/bin:$PATH"
}
