# list dotfiles
alias lsd='ls -od \.*'

# go to open finder window in terminal
# http://hints.macworld.com/article.php?story=20110817133623734
alias cdf='cd `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`'

#homeshick as a pseudo command
alias homesick=homeshick
