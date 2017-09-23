#!/usr/bin/env sh

SYNC_FOLDER=~/Dropbox/Sync/iTerm
SYNC_FILE=com.googlecode.iterm2.plist

if ! [ -e "$SYNC_FOLDER/$SYNC_FILE" ]; then
  echo "Sync file doesn't exist yet. Please check the status of your Dropbox sync."
fi

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Dropbox/Sync/iTerm"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
