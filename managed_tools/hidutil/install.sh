#!/usr/bin/env bash

sudo cp managed_tools/hidutil/com.apple.hidutil.plist /Library/LaunchDaemons/com.apple.hidutil.plist
sudo launchctl unload /Library/LaunchDaemons/com.apple.hidutil.plist
sudo launchctl load -w /Library/LaunchDaemons/com.apple.hidutil.plist
