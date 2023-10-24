#!/bin/bash

set -e

PATH="$HOME/bin:$HOME/opt/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

REPO_DIR=$(mktemp -d)
cd $REPO_DIR

git clone --depth 1 git@github.com:stefanistrate/dotfiles.git .

find /System/Library/Fonts/* 2> /dev/null | sort > snapshots/macos_fonts.txt
find ~/Library/Fonts/* 2> /dev/null | sort >> snapshots/macos_fonts.txt

git add snapshots/macos_fonts.txt
git commit -m "Save the current list of macOS fonts." || exit 0
git push
