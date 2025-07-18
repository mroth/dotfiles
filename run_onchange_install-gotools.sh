#!/bin/bash
set -euxo pipefail

tools=(
    golang.org/x/perf/cmd/benchstat@latest
    github.com/ajstarks/svgo/benchviz@latest

    golang.org/x/tools/cmd/deadcode@latest

    github.com/Gelio/go-global-update@latest
    github.com/mroth/go-bgtest@latest
)

# check if go is installed, if not, exit with error
if ! command -v go &> /dev/null; then
    echo "go could not be found, please install it first"
    exit 1
fi

# install all tools
for tool in "${tools[@]}"; do
    go install "$tool"
done
