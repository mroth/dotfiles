#!/bin/bash
# One-time cleanup: remove legacy Ruby/Bundler config files after removing
# them from chezmoi management.
for f in "$HOME/.gemrc" "$HOME/.bundle/config"; do
  if [[ -f "$f" ]]; then
    echo "Removing $f..."
    rm -f "$f"
  fi
done
if [[ -d "$HOME/.bundle" ]]; then
  # remove cache dir and .bundle itself if now empty
  rm -rf "$HOME/.bundle/cache"
  rmdir "$HOME/.bundle" 2>/dev/null
fi
