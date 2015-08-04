# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX=" (v:%{%B%F{blue}%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{%B%F{green}%})"

PROMPT='%{%f%k%b%}
%{%K{${bkg}}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%}$(git_prompt_info)$(virtualenv_prompt_info)%E%{%f%k%b%}
%{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%} %#%{%f%k%b%} '

#RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'

# if in a git repository, set an emoji to indicate the active user.email, to
# make sure I don't accidentally commit from the wrong email for a repository
function _git_email_prompt_info() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    email="${GIT_AUTHOR_EMAIL:-$(command git config --get user.email 2>/dev/null)}"
    case "$email" in
    "mrothenberg@gmail.com")
      echo "🚀 "
      ;;
    "mroth@khanacademy.org")
      echo "🌱 "
      ;;
    "mroth@polaroid.io")
      echo "🌈 "
      ;;
    *)
      echo "❔ "
      ;;
    esac
  fi
}

RPROMPT='$(_git_email_prompt_info)'
