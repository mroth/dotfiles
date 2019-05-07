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

#
# antigen
#
profile_start "antigen"
antigenSrc="/usr/local/share/antigen/antigen.zsh"
if [ -s "$antigenSrc" ]; then
  source $antigenSrc

  # OMZ plugins
  antigen use oh-my-zsh
  antigen bundle docker
  antigen bundle docker-compose
  antigen bundle golang
  antigen bundle heroku
  antigen bundle osx

  # other plugins
  #antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zdharma/fast-syntax-highlighting

  # my awesomely neato personal plugins
  antigen bundle mroth/evalcache
  antigen bundle mroth/git-prompt-useremail

  antigen theme blinks
  antigen apply
fi
profile_stop "antigen"

#
# alias hub to git when installed
#
profile_start "hub"
_evalcache hub alias -s
profile_stop "hub"

#
# scmpuff to enhance git further
#
profile_start "scmpuff"
_evalcache scmpuff init -s
profile_stop "scmpuff"

#
# load homeshick for dotfile management
#
profile_start "homeshick"
HOMESHICK="$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -s "$HOMESHICK" ]  && source "$HOMESHICK"
profile_stop "homeshick"

#
# source my main interactive shell environment configurations
#
profile_start "shell-env"
[ -s "$HOME/.shell_aliases.sh" ]     && source "$HOME/.shell_aliases.sh"
[ -s "$HOME/.shell_environment.sh" ] && source "$HOME/.shell_environment.sh"
autoload -Uz canhaz
profile_stop "shell-env"

profile_stop ".zshrc"
unfunction profile_start profile_stop

export RPROMPT='$(git_prompt_useremail_symbol) '
#
# Minimal prompt override if in VSCODE integrated terminal
#
if [ "$TERM_PROGRAM" = "vscode" ]; then
  export PROMPT="$ "
  export RPROMPT=""
fi
