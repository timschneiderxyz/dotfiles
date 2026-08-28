<h1 align="center">dotfiles</h1>

<p align="center">
  My dotfiles & configs as well as the setup of macOS.
</p>

<p align="center">
  <a aria-label="Apache 2.0 License" href="https://github.com/timschneiderxyz/dotfiles/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-apache 2.0-7aa2f7?style=for-the-badge&labelColor=1a1b26" alt="Apache 2.0 License">
  </a>
</p>

## Setup

1. Complete the initial Mac setup (Sign in to iCloud and the App Store).
2. Install Xcode command line tools: `xcode-select --install`.
3. Clone this repository: `git clone https://github.com/timschneiderxyz/dotfiles.git ~/Projects/personal/dotfiles`.
4. Run `~/Projects/personal/dotfiles/bootstrap.sh`.

## System Settings

- **General:**
  - Login Items & Extensions → Adjust options
- **Menu Bar:**
  - Recent documents, applications, and servers → `none`
- **Spotlight:**
  - Show Related Content → `false`
  - Improve Search → `false`
  - Results from Clipboard → `true` + `7 days`
- **Notifications:** Adjust options
- **Lock Screen:**
  - Require password after screen saver begins or display is turned off → `After 5 seconds`
- **Privacy & Security:** Adjust options
- **Keyboard:**
  - Keyboard Shortcuts → Input Sources → Uncheck `Select the previous input source`

## Apps

- Install Apps from the App Store: Xcode, TestFlight, Word, Excel, PowerPoint
- Remove all Apps from the Dock (`defaults write com.apple.dock persistent-apps -array && killall Dock`) and add yours.
- Finder Sidebar: Home, Projects, Downloads, Applications, iCloud Drive, Cloud Storage, External Disks, AirDrop, Connected servers, Network, Trash
- **Safari:**
  - General: Homepage → `about:blank`
  - General: Open "safe" files after downloading → `false`
  - AutoFill: `false`
  - Search: Include search engine suggestions → `false`
  - Search: Include Safari Suggestions → `false`
  - Advanced: Show full website address → `true`
  - Advanced: Allow websites to check for Apply Pay and Apple Card → `false`
  - Advanced: Show features for web developers → `true`
- **Mail:**
  - General: Follow Up Suggestions → `false`
  - General: When searching all mailboxes, include results from → `Trash, Junk`
  - Viewing: Show most recent message at the top → `true`
- **Chrome:**
  - Adjust settings for all profiles
  - Install extensions: Obsidian Web Clipper, Linkding, Bitwarden

## SSH

- Copy SSH keys and set permissions: `chmod 700 ~/.ssh` and `chmod 600 ~/.ssh/*`
- Switch dotfiles repository from HTTPS to SSH: `git remote set-url origin git@github.com:timschneiderxyz/dotfiles.git`
