#!/usr/bin/env bash

cd `dirname $0`
cp com.apple.hidutil.plist /Library/LaunchDaemons/com.apple.hidutil.plist
launchctl unload /Library/LaunchDaemons/com.apple.hidutil.plist
launchctl load -w /Library/LaunchDaemons/com.apple.hidutil.plist
