#!/bin/bash
set -euxo pipefail

exts=(
    dlvhdr/gh-dash
    mislav/gh-license
)

# check if gh is installed, if not, exit with error
if ! command -v gh &> /dev/null; then
    echo "gh could not be found, please install GitHub CLI first"
    exit 1
fi

# install all extensions
for ext in "${exts[@]}"; do
    gh extension install "$ext"
done
