# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem brew heroku npm osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#
# source my main interactive shell environment configurations
#
[ -s "$HOME/.shell_aliases.sh" ]          && source "$HOME/.shell_aliases.sh"
[ -s "$HOME/.shell_environment.sh" ]      && source "$HOME/.shell_environment.sh"
[ -s "$HOME/.shell_functions.sh" ]        && source "$HOME/.shell_functions.sh"

#
# load scm_breeze to make git less painful
#
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ]  && source "$HOME/.scm_breeze/scm_breeze.sh"


# for iterm2 "reuse previous tab's directory" feature, make sure rvmrc is run when new tab opens
# NOTE: disabled for now since no longer using RVM, but keeping around in case I go back to it.
#
# if [ -s "$HOME/.rvm/scripts/rvm" ]; then
#   __rvm_project_rvmrc
# fi

#
# add npm global binaries to path.
# for some reason homebrew doesn't like to do this automatically
# REMINDER: periodically check if homebrew has decided to handle this and remove from here if so
# WE DONT NEED THIS RIGHT NOW SINCE NOT USING BREW VERSION OF NPM ANYMORE
#
# PATH=$PATH:/usr/local/share/npm/bin
