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
3. Install Ansible: `python3 -m pip install --user ansible`.
4. Add Ansible to your `$PATH`: `export PATH="$PATH:$HOME/Library/Python/3.9/bin"`
5. Clone or download this repository to your local `$HOME` directory.
6. Change directory to `playbook` and run `ansible-playbook main.yaml`.

## Manual Steps

### Apps

- Install Apps from the App Store:
  - [Magnet](https://magnet.crowdcafe.com/)
  - Word
  - Excel
  - PowerPoint
- Remove all Apps from the Dock (`defaults write com.apple.dock persistent-apps -array && killall Dock`) and add yours.
- Log into all your Apps: OneDrive, Discord, etc.
- Finder:
  - Toolbar
    - Back/Forward
    - View
    - Space
    - Group
    - Action
    - Space
    - Search
  - Sidebar
    - Home
    - Projects
    - Downloads
    - Applications
    - AirDrop
    - iCloud Drive
    - External Disks
    - Cloud Storage
    - Connected servers
- Safari:
  - General: Homepage → `about:blank`
  - General: Open "safe" files after downloading → `false`
  - AutoFill: `false`
  - Search: Include search engine suggestions → `false`
  - Search: Include Safari Suggestions → `false`
  - Advanced: Show full website address → `true`
  - Advanced: Allow websites to check for Apply Pay and Apple Card → `false`
  - Advanced: Show features for web developers → `true`
- Mail:
  - General: Enable message follow up suggestions → `false`
  - General: When searching all mailboxes, include results from → `Trash, Junk`
  - Viewing: Show most recent message at the top → `true`

### System

- Battery: Options → Prevent automatic sleeping on power adapter when the display is off → `true`
- Notifications: Adjust options.
- Lock Screen: Require password after screen saver begins or display is turned off → `After 5 seconds`
- Privacy & Security: App Management → Add `kitty.app`
- Spotlight: Search results
  - Applications
  - Calculator
  - Contacts
  - Documents
  - Events & Reminders
  - Folders
  - Fonts
  - Images
  - Mail & Messages
  - PDF Documents
  - Presentations
  - Spreadsheets
  - System Settings
- Spotlight: Improve Search → `false`
- Keyboard: Press fn key to → `Do Nothing`
- Keyboard: Keyboard Shortcuts → Input Sources → Uncheck "Select the previous input source" (<kbd>Control</kbd> + <kbd>Space</kbd>)
- Keyboard: Keyboard Shortcuts → Modifier Keys → Remap <kbd>Caps Lock</kbd> to <kbd>ESC</kbd>
- Keyboard: Input Sources → Edit → Show Input menu in menu bar → `false`
- Copy SSH keys and set permissions (`chmod 700 ~/.ssh` and `chmod 600 ~/.ssh/*`).

## Special Thanks

To [Jeff Geerling](https://github.com/geerlingguy) for his [Mac Dev Playbook](https://github.com/geerlingguy/mac-dev-playbook), [Ansible Collection Mac](https://github.com/geerlingguy/ansible-collection-mac) and generally for all his contributions to the open source community.
