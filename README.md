<p align="center">
  <img src="https://github.com/timschneiderxyz/dotfiles/blob/main/playbook-mac.png" width="250" height="156" alt="Playbook Mac">
</p>

<h1 align="center">dotfiles</h1>

<p align="center">
  My dotfiles & configs as well as the setup of macOS via Ansible.
</p>

<p align="center">
  <a aria-label="Apache 2.0 License" href="https://github.com/timschneiderxyz/dotfiles/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-apache 2.0-7aa2f7?style=for-the-badge&labelColor=1a1b26" alt="Apache 2.0 License">
  </a>
</p>

## Setup

1. Complete the initial Mac setup (Sign in to iCloud and the App Store).
2. Install Xcode command line tools: `xcode-select --install`.
3. Install Ansible: `python3 -m pip install --user ansible`.
4. Add Ansible to your `$PATH`: `export PATH="$PATH:$HOME/Library/Python/3.9/bin"`
5. Clone or download this repository to your local drive.
6. Run `ansible-playbook main.yaml --ask-become-pass` inside this directory.

## Apps

- Install Apps from the App Store:
  - [Magnet](https://magnet.crowdcafe.com/)
  - Word
  - Excel
  - PowerPoint
- Finder → Sidebar:
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
  - General: Follow Up Suggestions → `false`
  - General: When searching all mailboxes, include results from → `Trash, Junk`
  - Viewing: Show most recent message at the top → `true`
- Arc:
  - Adjust options for all profiles: Autofill and passwords, Privacy and security, Languages.
  - Install extensions.

## System Settings

- Notifications: Adjust options.
- Lock Screen: Require password after screen saver begins or display is turned off → `After 5 seconds`
- Privacy & Security: Adjust options.
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
- Keyboard: Press Globe key to → `Do Nothing`
- Keyboard: Keyboard Shortcuts → Input Sources → Uncheck "Select the previous input source" (<kbd>Control</kbd> + <kbd>Space</kbd>)
- Keyboard: Keyboard Shortcuts → Modifier Keys → Remap <kbd>Caps Lock</kbd> to <kbd>ESC</kbd>
- Trackpad: Look up & data detectors → `off`
- Mouse: Advanced → Pointer acceleration → `false`

## Other

- Remove all Apps from the Dock (`defaults write com.apple.dock persistent-apps -array && killall Dock`) and add yours.
- Set default permissions for directories and files:
  - `find Projects -type d -exec chmod 755 {} \;`
  - `find Projects -type f -exec chmod 644 {} \;`
- Copy SSH keys and set permissions: 
  - `chmod 700 ~/.ssh`
  - `chmod 600 ~/.ssh/*`
- Log in to all your Apps.
- Restart the Computer.
