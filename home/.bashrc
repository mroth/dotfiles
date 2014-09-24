# bashrc is executed for all interactive bash shells
# I use zsh so this is just for in case I need to go in there for some reason make sure important stuff works

#
# Run our main shell configuration
#
function source_if_exists {
    file=${1}

    if [ -f ${file} ]; then
        source ${file}
    fi
}
source_if_exists ~/.shell_aliases.sh
source_if_exists ~/.shell_environment.sh
source_if_exists ~/.shell_functions.sh

#
# source git completion from homebrew git install (always brew install git!)
#
source_if_exists /usr/local/etc/bash_completion.d/git-completion.bash
