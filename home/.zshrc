# User shell configuration
# As a reminder .zshrc is for stuff that modifies the INTERACTIVE shell only.

#
# oh-my-zsh configuration
#   for reference later or additional variables, use the template file:
#   ~/.oh-my-zsh/templates/zshrc.zsh-template
#
export ZSH=$HOME/.oh-my-zsh     # Path to your oh-my-zsh installation
ZSH_THEME="blinks-mroth"        # Set name of the theme to load.
DISABLE_AUTO_UPDATE="true"      # Disable auto-update checks. (speed up!)
COMPLETION_WAITING_DOTS="true"  # red dots whilst waiting for completion.

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew brew-cask coffee heroku osx zsh-syntax-highlighting)

#
# source oh-my-zsh (in a safe way, unlike their template!)
#
[ -s "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

#
# alias gh to git when installed (`gh` is the new `hub`)
#
if type gh > /dev/null; then eval "$(gh alias -s)"; fi

#
# load rbenv in fairly smart way
#
if type rbenv > /dev/null; then eval "$(rbenv init --norehash - zsh)"; fi

#
# load scm_breeze to make git less painful
#
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ]  && source "$HOME/.scm_breeze/scm_breeze.sh"

#
# load homeshick for dotfile management
#
[ -s "$HOME/.homesick/repos/homeshick/homeshick.sh" ]  && source "$HOME/.homesick/repos/homeshick/homeshick.sh"

#
# source my main interactive shell environment configurations
#
[ -s "$HOME/.shell_aliases.sh" ]          && source "$HOME/.shell_aliases.sh"
[ -s "$HOME/.shell_environment.sh" ]      && source "$HOME/.shell_environment.sh"
[ -s "$HOME/.shell_functions.sh" ]        && source "$HOME/.shell_functions.sh"
