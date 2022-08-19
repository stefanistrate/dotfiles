#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ ! -d /Applications ]]; then
  exit
fi

REPO_DIR=$( mktemp -d )
cd $REPO_DIR

git clone --depth 1 https://github.com/stefanistrate/dotfiles.git .

ls -1 /Applications > managed/cron/data/applications-list.txt

git add managed/cron/data/applications-list.txt
git commit -m "Sync macOS applications list."
git push
