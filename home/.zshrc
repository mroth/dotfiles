#!/bin/zsh
# User shell configuration
# As a reminder .zshrc is for stuff that modifies the INTERACTIVE shell only.

# Where my custom zsh functions live
fpath=( ~/.zfunctions "${fpath[@]}" )

# set up some very basic profiling of how long zshrc takes to load.
# to test, use: ZSHRC_PROFILE=true zsh -ic "exit"
declare -A ZSHRC_LOAD_START=()
declare -A ZSHRC_LOAD_STOP=()
declare -A ZSHRC_LOAD_TIME=()

function profile_start () {
  if [[ "$ZSHRC_PROFILE" = true ]]; then
    ZSHRC_LOAD_START[$1]=$(gdate "+%s%3N")
  fi
}

function profile_stop () {
  if [[ "$ZSHRC_PROFILE" = true ]]; then
    ZSHRC_LOAD_STOP[$1]=$(gdate "+%s%3N")
    ZSHRC_LOAD_TIME[$1]=$(echo "$ZSHRC_LOAD_STOP[$1] - $ZSHRC_LOAD_START[$1]" | bc)
    printf "\033[1m%12s\033[0m loaded in:\t%4dms\n" $1 $ZSHRC_LOAD_TIME[$1]
  fi
}

profile_start ".zshrc"

#############################################################################
# HOMEBREW PREFIX
#############################################################################
#
# Some of the paths sourced here are based upon knowing the HOMEBREW_PREFIX.
# Invoking $(brew --prefix) takes about ~25ms on average, so previously I 
# hardcoded this value, assuming it would always be in the standard location.
# However, the standard location now differs based on whether the mac is on
# x86_64 or arm64 architecture.
#
# $(/usr/bin/uname -m) averages only ~1ms, and is what the homebrew installer
# uses to determine the default brew installation path, so we can replicate
# that logic.
profile_start "brew-prefix"
UNAME_MACHINE=$(/usr/bin/uname -m)
if [[ "${UNAME_MACHINE}" == "arm64" ]]
then
  # On ARM macOS, default script installs to /opt/homebrew only
  HOMEBREW_PREFIX="/opt/homebrew"
  HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
else
  # On Intel macOS, default script installs to /usr/local only
  HOMEBREW_PREFIX="/usr/local"
  HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
fi
profile_stop "brew-prefix"

#############################################################################
# HOMEBREW COMPLETIONS
#############################################################################
#
# This must occur prior to compinit being invoked, which OMZ does automatically
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
# 
# Originally `FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH`,
# but brew prefix path hardcoded to avoid extra shellcall invocation (saves 20+ms!)
profile_start "brew-comp"
if type brew &>/dev/null; then
  FPATH=${HOMEBREW_PREFIX}/share/zsh/site-functions:$FPATH
fi
profile_stop "brew-comp"

#############################################################################
# ANTIGEN ZSH PLUGIN MANAGER
#############################################################################
profile_start "antigen"
antigenSrc="${HOMEBREW_PREFIX}/share/antigen/antigen.zsh"
if [ -s "$antigenSrc" ]; then
  source $antigenSrc

  # OMZ plugins
  antigen use oh-my-zsh
  antigen bundle docker
  antigen bundle docker-compose
  antigen bundle golang
  antigen bundle macos

  # other plugins
  #antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zdharma-continuum/fast-syntax-highlighting

  # my awesomely neato personal plugins
  antigen bundle mroth/evalcache
  antigen bundle mroth/git-prompt-useremail

  antigen theme blinks
  antigen apply
fi
profile_stop "antigen"

#############################################################################
# scmpuff to enhance git further
#############################################################################
profile_start "scmpuff"
_evalcache scmpuff init -s
profile_stop "scmpuff"

#############################################################################
# load homeshick for dotfile management
#############################################################################
profile_start "homeshick"
HOMESHICK="$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -s "$HOMESHICK" ]  && source "$HOMESHICK"
profile_stop "homeshick"

#############################################################################
# gcloud completions
#############################################################################
# profile_start "gcloud"
# GCLOUD="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
# [ -s "$GCLOUD/path.zsh.inc" ]       && source "$GCLOUD/path.zsh.inc"
# [ -s "$GCLOUD/completion.zsh.inc" ] && source "$GCLOUD/completion.zsh.inc"
# profile_stop "gcloud"

#############################################################################
# SHELL ENVIRONMENT
#############################################################################
profile_start "shell-env"

### shell aliases ###

# list dotfiles
alias lsd='ls -od \.*'

# homeshick as a pseudo command
alias homesick=homeshick

# my code todos
alias td='rg TODO'

# for obsessive version checking
alias brewsup='brew update && brew outdated'
alias brewup='brew upgrade && brew cleanup'

# since you have to type it so much
alias be='bundle exec'

# darwin specific
# add hidden airport CLI command
# since I'm noncommital just alias instead of polluting $PATH or symlinking
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

### shell environment ###

# global environment settings/variables
export EDITOR='vim'
export GIT_EDITOR='vim'
export HOMEBREW_EDITOR='vim'
export CLICOLOR=1

# set default GOPATH, add `go install` bin directory to default path (but make
# it last so /usr/local et al take precedence), and set a convenience env var
# to make it less annoying to navigate to my old GOPATH code src.
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOCODE=$GOPATH/src/github.com/mroth

# and now rust wants to have its own path as well (kinda, way less annoying tho)
export PATH="$HOME/.cargo/bin:$PATH"

# lolcommits related prefs
export LOLCOMMITS_DELAY=1

# Bundler: add local repo binstubs to default path
export PATH=.bundle/binstubs:$PATH

# Python, you make a big mess with your *.pyc bullshit.
export PYTHONDONTWRITEBYTECODE=1

# set some convenience variables for things I can never remember where they are
export DOTFILES="$HOME/.homesick/repos/dotfiles/home"
export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# configure right prompt for git prompt useremail setup
export RPROMPT='$(git_prompt_useremail_symbol) '

# Minimal prompt override if in VSCODE integrated terminal
if [ "$TERM_PROGRAM" = "vscode" ]; then
  export PROMPT="$ "
  export RPROMPT=""
fi

### load zfunctions ###
autoload -Uz canhaz

profile_stop "shell-env"


profile_stop ".zshrc"
unfunction profile_start profile_stop