#!/bin/bash

PATH="$HOME/bin:$HOME/opt/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

if [[ ! -x "$(command -v brew)" ]]; then
  exit
fi

REPO_DIR=$( mktemp -d )
cd $REPO_DIR

git clone --depth 1 https://github.com/stefanistrate/dotfiles.git .

brew list --version > data/brew-list.txt

git add data/brew-list.txt
git commit -m "Sync Homebrew packages."
git push
