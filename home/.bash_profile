#!/bin/bash

# bashrc is executed for all interactive bash shells,
# but macos seems to prefer bash_profile these days...
#
# I use zsh so this is just for in case I need to go in there for some reason
# make sure some important stuff works?
#
# Maybe it's just more of a reminder in case I ever go back to bash (hah!).

#
# Run our main shell configuration
#
function source_if_exists {
    file=${1}
    if [ -f "${file}" ]; then
        # shellcheck disable=SC1090
        source "${file}"
    fi
}

#
# source git completion from homebrew git install (always brew install git!)
#
source_if_exists /usr/local/etc/bash_completion.d/git-completion.bash

# source all homebrew provided completions for bash
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-bash
#
# modified for speed, see: https://github.com/Homebrew/brew/pull/6105
# HOMEBREW_PREFIX=$(brew --prefix)
HOMEBREW_PREFIX=/usr/local
if type brew &>/dev/null; then
  for COMPLETION in "$HOMEBREW_PREFIX"/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
  if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh ]];
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  fi
fi

# ultra simple shell prompt, since I use bash mostly for CLI app screenshots and
# dont want any personalized info
export PS1="\[\e[2m\]$\[\e[0m\] "
