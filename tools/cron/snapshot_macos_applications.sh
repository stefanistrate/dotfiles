#!/bin/bash

set -e

PATH="$HOME/bin:$HOME/opt/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

if [[ ! -d /Applications ]]; then
  echo "Missing /Applications directory!" >&2
  exit 1
fi

REPO_DIR=$(mktemp -d)
cd $REPO_DIR

git clone --depth 1 git@github.com:stefanistrate/dotfiles.git .

ls -1 /Applications > snapshots/macos_applications.txt

git add snapshots/macos_applications.txt
git commit -m "Save current list of macOS applications." || exit 0
git push
