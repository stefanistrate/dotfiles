#!/bin/bash

set -e

PATH="$HOME/bin:$HOME/opt/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

if [[ ! -x "$(command -v brew)" ]]; then
  echo "Missing brew command!" >&2
  exit 1
fi

REPO_DIR=$(mktemp -d)
cd $REPO_DIR

git clone --depth 1 git@github.com:stefanistrate/dotfiles.git .

brew list --version > snapshots/homebrew_packages.txt

git add snapshots/homebrew_packages.txt
git commit -m "Save current list of Homebrew packages." || exit 0
git push
