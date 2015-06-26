# list dotfiles
alias lsd='ls -od \.*'

# homeshick as a pseudo command
alias homesick=homeshick

# my code todos
alias td='ack TODO'

# for obsessive version checking
alias brewsup='brew update && brew outdated'
alias brewup='brew upgrade --all && brew cleanup'

# since you have to type it so much
alias be='bundle exec'

# "clean" GHC shoving intermediate files into /tmp
# for when I'm working on quick scripts and dont really care about them
# also enable -O2 optimization by default
alias ghcc='ghc -O2 -outputdir /tmp/ghc'

# darwin specific
# add hidden airport CLI command
# since I'm noncommital just alias instead of polluting $PATH or symlinking
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
