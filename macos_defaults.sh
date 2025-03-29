defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled -bool "false"

defaults write com.apple.dock "tilesize" -int "54"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.5"
# killall Dock 

defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "type" -string "heic"

defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
# killall Finder

defaults write NSGlobalDomain com.apple.mouse.scaling -float "1"
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "0"
# defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"

# Disable in-app rating requests from apps downloaded from the App Store.
defaults write com.apple.appstore InAppReviewEnabled -int 0