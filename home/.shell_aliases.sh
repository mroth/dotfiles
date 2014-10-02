# list dotfiles
alias lsd='ls -od \.*'

# homeshick as a pseudo command
alias homesick=homeshick

# my code todos
alias td='ack TODO'

# for obsessive version checking
alias brewsup='brew update && brew outdated'
alias brewup='brew upgrade && brew cleanup'

# "clean" GHC shoving intermediate files into /tmp
# for when I'm working on quick scripts and dont really care about them
# also enable -O2 optimization by default
alias ghcc='ghc -O2 -outputdir /tmp/ghc'
