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

  # setup gcloud tools, these are only available via binary, so get them
  # via `brew cask install google-cloud-sdk`. most of the important ones are
  # added to the path at install, but anything added afterwards (e.g. kubectl),
  # is not.
  GCLOUD="/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
  [ -s "$GCLOUD/path.zsh.inc" ]       && source "$GCLOUD/path.zsh.inc"
  [ -s "$GCLOUD/completion.zsh.inc" ] && source "$GCLOUD/completion.zsh.inc"
  # below is so that local tests know where to find appengine libs
  export PYTHONPATH="$GCLOUD/platform/google_appengine"
}
