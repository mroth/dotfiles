#!/bin/bash
# One-time cleanup: remove antigen cache directory after migrating to
# direct homebrew sourcing of zsh plugins.
if [[ -d "$HOME/.antigen" ]]; then
  echo "Removing antigen cache directory (~/.antigen)..."
  rm -rf "$HOME/.antigen"
fi
