My dotfiles.  Not much here, trying to keep configuration management in other places.

## Setup
### Automatic
Usually managed by the `dotfiles:install` task v3 of [mroth/bootstrapper](http://github.com/mroth/bootstrapper), so ignore me.

### Manual

    gem install homesick
    homesick clone https://github.com/mroth/dotfiles.git
    homesick symlink dotfiles

To update, do `homesick pull dotfiles`.
