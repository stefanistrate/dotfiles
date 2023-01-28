#!/bin/bash

PATH="$HOME/bin:$HOME/opt/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

if [[ ! -d /Applications ]]; then
  exit
fi

REPO_DIR=$( mktemp -d )
cd $REPO_DIR

git clone --depth 1 git@github.com:stefanistrate/dotfiles.git .

ls -1 /Applications > data/applications-list.txt

git add data/applications-list.txt
git commit -m "Sync /Applications list."
git push
