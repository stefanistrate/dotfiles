#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ -f /usr/local/bin/brew ]]; then
  BREW_BIN=/usr/local/bin/brew
else
  exit
fi

REPO_DIR=`mktemp -d`
cd $REPO_DIR

git clone --depth 1 https://github.com/stefanistrate/dotfiles.git .

$BREW_BIN list --version > managed/cron/data/brew-list.txt

git add managed/cron/data/brew-list.txt
git commit -m "Sync brew packages."
git push
