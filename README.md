# dotfiles

My .dotfiles repository. _There are many like it, but this one is mine._

Currently managed via [chezmoi](https://github.com/twpayne/chezmoi).


## New Mac

1. Install homebrew

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

2. Install brewfile apps

        curl https://raw.githubusercontent.com/mroth/dotfiles/main/dot_Brewfile -o ~/.Brewfile
        brew bundle --global

3. Install dotfiles

        chezmoi init mroth --apply

