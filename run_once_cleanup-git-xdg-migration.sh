#!/bin/bash
# One-time cleanup: remove legacy git config files after migrating to
# XDG_CONFIG_HOME (~/.config/git/).
for f in "$HOME/.gitconfig" "$HOME/.gitignore"; do
  if [[ -f "$f" ]]; then
    echo "Removing $f..."
    rm -f "$f"
  fi
done
for f in "$HOME/src/protocol/.gitconfig.inc" "$HOME/src/dojo/.gitconfig.inc"; do
  if [[ -f "$f" ]]; then
    echo "Removing $f..."
    rm -f "$f"
  fi
done
