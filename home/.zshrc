#
# oh-my-zsh configuration
#   for reference later, refer to ~/.oh-my-zsh/templates/zshrc.zsh-template !
#

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks-mroth"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(bundler brew brew-cask coffee heroku osx zsh-syntax-highlighting)

# source ohmyzsh (commented out here because I do it my own safer way below)
# source $ZSH/oh-my-zsh.sh

# User configuration (here and below is no longer ohmyzsh template land)
# As a reminder .zshrc is for stuff that modifies the INTERACTIVE shell only.

#
# source ohmyzsh in a safe way
#
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
if type gh > /dev/null; then eval "$(gh alias -s)"; fi

#
# load rbenv in smart way
#
if type rbenv > /dev/null; then eval "$(rbenv init --norehash - zsh)"; fi
