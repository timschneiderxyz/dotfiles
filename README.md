<p align="center">
  <img src="https://github.com/timschneiderxyz/dotfiles/blob/main/playbook-mac.png" width="250" height="156" alt="Playbook Mac">
</p>

<h1 align="center">dotfiles</h1>

<p align="center">
  My dotfiles & configs as well as the setup of macOS via Ansible.
</p>

<p align="center">
  <a aria-label="MIT License" href="https://github.com/timschneiderxyz/dotfiles/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-mit-689d6a?style=for-the-badge&labelColor=000000" alt="MIT License">
  </a>
</p>

## Setup

1. Complete the initial Mac setup (Sign in to iCloud and the App Store).
2. Install Xcode command line tools: `xcode-select --install`.
3. Upgrade pip: `sudo pip3 install --upgrade pip`
4. Install Ansible: `pip3 install ansible`.
5. Add Ansible to your `$PATH`: `export PATH="$PATH:$HOME/Library/Python/3.9/bin"`
6. Clone or download this repository to your local `$HOME` directory.
7. Change directory to `playbook` and run `ansible-playbook main.yaml`.

## Manual Steps

### Apps

- Install Apps from the App Store:
  - [Magnet](https://magnet.crowdcafe.com/)
  - Word
  - Excel
  - PowerPoint
- Remove all Apps from the Dock (`defaults write com.apple.dock persistent-apps -array && killall Dock`) and add yours.
- Log into all your Apps: OneDrive, Discord, etc.
- Safari:
  - General: Homepage → `about:blank`
  - General: Open "safe" files after downloading → `false`
  - AutoFill: `false`
  - Search: Include search engine suggestions → `false`
  - Search: Include Safari Suggestions → `false`
  - Privacy: Apply Pay and Apple Card → `false`
  - Privacy: Web advertising → `false`
  - Advanced: Show full website address → `true`
  - Advanced: Show Develop menu in menu bar → `true`
- Mail:
  - General: Enable message follow up suggestions → `false`
  - General: When searching all mailboxes, include results from → `Trash, Junk`
  - Viewing: Show most recent message at the top → `true`

### System

- Notifications: Adjust options.
- Siri & Spotlight → exclude from Spotlight search:
  - Bookmarks & History
  - Definition
  - Fonts
  - Movies
  - Music
  - Other
  - Siri Suggestions
- Privacy & Security: App Management → Add Terminal.app
- Battery: Options → Prevent automatic sleeping on power adapter when the display is off → `true`
- Lock Screen: Require password after screen saver begins or display is turned off → `After 5 seconds`
- Keyboard: Keyboard Shortcuts → Input Sources → Uncheck "Select the previous input source" (<kbd>Control</kbd> + <kbd>Space</kbd>)
- Customize Finder sidebar and toolbar.
- Copy SSH keys and set permissions (`chmod 700 ~/.ssh` and `chmod 600 ~/.ssh/*`).

## Special Thanks

To [Jeff Geerling](https://github.com/geerlingguy) for his [Mac Dev Playbook](https://github.com/geerlingguy/mac-dev-playbook), [Ansible Collection Mac](https://github.com/geerlingguy/ansible-collection-mac) and generally for all his contributions to the open source community.
