#!/bin/sh
#                              _
#   ___ ___  _ __  _   _   ___| |__
#  / __/ _ \| '_ \| | | | / __| '_ \
# | (_| (_) | |_) | |_| |_\__ \ | | |
#  \___\___/| .__/ \__, (_)___/_| |_|
#           |_|    |___/


git clone https://github.com/timschneiderxyz/dotfiles.git > /dev/null 2>&1
cp -r dotfiles/wsl/. ~/
rm -rf dotfiles
