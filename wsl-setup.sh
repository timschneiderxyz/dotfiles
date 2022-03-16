#!/bin/sh
#           _                    _
#  ___  ___| |_ _   _ _ __   ___| |__
# / __|/ _ \ __| | | | '_ \ / __| '_ \
# \__ \  __/ |_| |_| | |_) |\__ \ | | |
# |___/\___|\__|\__,_| .__(_)___/_| |_|
#                    |_|


# Add repositories
for x in ppa:git-core/ppa ppa:ondrej/php; do
  sudo add-apt-repository $x > /dev/null 2>&1
done

# Update
sudo -- sh -c 'apt update && apt upgrade -y && apt autoremove -y && apt autoclean -y' > /dev/null 2>&1

# Install packages
for x in zsh make php8.1-fpm php8.1-curl php8.1-zip; do
  sudo apt install -y $x > /dev/null 2>&1
done

# Copy dotfiles
git clone https://github.com/RanzigeButter/dotfiles.git > /dev/null 2>&1
cp -r dotfiles/wsl/. ~/
rm -rf dotfiles

# Create directories
mkdir -p \
  ~/.local/bin \
  ~/.local/share \
  ~/.cache \
  ~/Projects

# Setup zsh
mkdir -p \
  ~/.local/bin/zsh \
  ~/.cache/zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/bin/zsh/syntax-highlighting > /dev/null 2>&1
sudo chsh -s /bin/zsh tim

# Install Composer
curl -fsSL getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin/ --filename=composer > /dev/null 2>&1

# Install nvm/NodeJS/npm
git clone https://github.com/nvm-sh/nvm.git ~/.local/bin/nvm > /dev/null 2>&1
. ~/.local/bin/nvm/nvm.sh && nvm install --lts --latest-npm > /dev/null 2>&1
