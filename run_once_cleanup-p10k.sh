#!/bin/bash
# One-time cleanup: remove Powerlevel10k config and cache files after
# migrating to oh-my-posh.
if [[ -f "$HOME/.p10k.zsh" ]]; then
  echo "Removing ~/.p10k.zsh..."
  rm -f "$HOME/.p10k.zsh"
fi

# remove p10k cache files and gitstatus binary (used by p10k)
for f in "$HOME"/.cache/p10k-* "$HOME/.cache/gitstatus"; do
  if [[ -e "$f" ]]; then
    echo "Removing $f..."
    rm -rf "$f"
  fi
done
