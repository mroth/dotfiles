# User shell configuration
# As a reminder .zshrc is for stuff that modifies the INTERACTIVE shell only.

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
# oh-my-zsh configuration
#   for reference later or additional variables, use the template file:
#   ~/.oh-my-zsh/templates/zshrc.zsh-template
#
profile_start "oh-my-zsh"
export ZSH=$HOME/.oh-my-zsh     # Path to your oh-my-zsh installation
ZSH_THEME="blinks-mroth"        # Set name of the theme to load.
DISABLE_AUTO_UPDATE="true"      # Disable auto-update checks. (speed up!)
COMPLETION_WAITING_DOTS="true"  # red dots whilst waiting for completion.

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose golang heroku osx virtualenv zsh-syntax-highlighting)

#
# source oh-my-zsh (in a safe way, unlike their template!)
#
[ -s "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"
profile_stop "oh-my-zsh"

#
# alias hub to git when installed
#
profile_start "hub"
if type hub > /dev/null; then
  eval "$(hub alias -s)"
fi
profile_stop "hub"

#
# load rbenv in fairly smart way
#
profile_start "rbenv"
if type rbenv > /dev/null; then
  eval "$(rbenv init --norehash - zsh)"
fi
profile_stop "rbenv"

#
# scmpuff to enhance git further
#
profile_start "scmpuff"
if type scmpuff > /dev/null; then
  eval "$(scmpuff init -s)"
fi
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
[ -s "$HOME/.shell_functions.sh" ]   && source "$HOME/.shell_functions.sh"
profile_stop "shell-env"

profile_stop ".zshrc"
unfunction profile_start profile_stop
