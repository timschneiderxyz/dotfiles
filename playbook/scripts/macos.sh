#!/bin/zsh
#                        ___  ____
#  _ __ ___   __ _  ___ / _ \/ ___|
# | '_ ` _ \ / _` |/ __| | | \___ \
# | | | | | | (_| | (__| |_| |___) |
# |_| |_| |_|\__,_|\___|\___/|____/


# ==============================================================================
# General
# ==============================================================================

# Don’t create .DS_Store files on USB and network volumes.
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Hide Spotlight icon from the menubar.
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# ==============================================================================
# Appearance
# ==============================================================================

# Set 'Show scroll bars' to 'always'.
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# ==============================================================================
# Desktop & Dock
# ==============================================================================

# Set the icon size of Dock items.
defaults write com.apple.dock tilesize -int 48

# Make Dock icons of hidden applications translucent.
defaults write com.apple.dock showhidden -bool true

# Set 'Minimize windows using' to 'Scale effect'.
defaults write com.apple.dock mineffect -string "scale"

# Set 'Show suggested and recent apps in Dock' to false.
defaults write com.apple.dock recent-apps -array
defaults write com.apple.dock show-recents -bool false

# Set 'Click wallpaper to reveal desktop' to 'Only in Stage Manager'.
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Hot Corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# ==============================================================================
# Lock Screen
# ==============================================================================

# Set 'Start Screen Saver when inactive' to 'never'.
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Set 'Turn display off on battery when inactive' to 10 minutes.
sudo pmset -b displaysleep 10

# Set 'Turn display off on power adapter when inactive' to 30 minutes.
sudo pmset -c displaysleep 30

# ==============================================================================
# Keyboard / Trackpad / Mouse
# ==============================================================================

# Set the key repeat rate and make it happen more quickly.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Disable all automatic correction and substitution features.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Set trackpad and mouse speed.
defaults write -g com.apple.trackpad.scaling -float 1
defaults write -g com.apple.mouse.scaling -float -1

# ==============================================================================
# Finder
# ==============================================================================

# Hide icons for hard drives, removable media and servers on the Desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Set 'New Finder windows show' to '$HOME'.
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Set 'Show all file extensions' to true.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Set 'Show warning before changing an extension' to false.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set 'Remove items from the Trash after 30 days' to true.
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Set 'Keep folders on top' for 'In windows when sorting by name' to true.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Set 'When performing a search' to 'Search the Current Folder'.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view in all Finder windows by default.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show pathbar.
defaults write com.apple.finder ShowPathbar -bool true

# Show statusbar.
defaults write com.apple.finder ShowStatusBar -bool true

# No hover delay for the hidden icon in the toolbar.
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Set the spring loading delay for folders.
defaults write NSGlobalDomain com.apple.springing.delay -float 0.2

# Enable snap-to-grid for icons on the Desktop and in Finder.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Show the ~/Library folder.
chflags nohidden ~/Library

# ==============================================================================
# Apps
# ==============================================================================

# Screenshot: Set format and location.
defaults write com.apple.screencapture type -string "jpg"
defaults write com.apple.screencapture location -string "$HOME/Downloads"

# Terminal: Don’t mark lines.
defaults write com.apple.Terminal AutoMarkPromptLines -bool false

# ==============================================================================
# Restart
# ==============================================================================

for app in "SystemUIServer" "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done
