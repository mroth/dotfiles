#
# oh-my-zsh configuration
#   for reference later, refer to ~/.oh-my-zsh/templates/zshrc.zsh-template !
#
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Use the following to silently update without bothering to prompt the user.
#  (Not in the default oh-my-zsh zshrc template, but I discovered it debugging random shit)
# DISABLE_UPDATE_PROMPT="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler brew coffee heroku npm osx zsh-syntax-highlighting)

# here and below is no longer template land
[ -s "$ZSH/oh-my-zsh.sh" ]                && source "$ZSH/oh-my-zsh.sh"

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

#
# load homeshick using new method
#
[ -s "$HOME/.homesick/repos/homeshick/homeshick.sh" ]  && source "$HOME/.homesick/repos/homeshick/homeshick.sh"

#
# alias hub to git when installed (now using gh instead)
#
if which gh > /dev/null; then eval "$(gh alias -s)"; fi


#
# add npm global binaries to path.
# for some reason homebrew doesn't like to do this automatically
# REMINDER: periodically check if homebrew has decided to handle this and remove from here if so
# WE DONT NEED THIS RIGHT NOW SINCE NOT USING BREW VERSION OF NPM ANYMORE
#
# PATH=$PATH:/usr/local/share/npm/bin
