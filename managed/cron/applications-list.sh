#!/bin/bash

if [[ ! -d /Applications ]]; then
  exit
fi

REPO_DIR=$( mktemp -d )
cd $REPO_DIR

git clone --depth 1 https://github.com/stefanistrate/dotfiles.git .

ls -1 /Applications > data/applications-list.txt

git add data/applications-list.txt
git commit -m "Sync applications list."
git push
