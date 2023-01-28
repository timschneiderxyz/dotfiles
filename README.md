<p align="center">
  <img src="https://github.com/timschneiderxyz/playbook-mac/blob/main/playbook-mac.png" width="250" height="156" alt="Playbook Mac Logo">
</p>

<h1 align="center">Playbook Mac</h1>

<p align="center">
  Mac setup and configuration via Ansible.
</p>

<p align="center">
  <a aria-label="License" href="https://github.com/timschneiderxyz/playbook-mac/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-mit-689d6a?style=for-the-badge&labelColor=000000">
  </a>
</p>

## Setup

1. Complete the initial Mac setup (Sign in to iCloud and the App Store).
2. Install Xcode command line tools: `xcode-select --install`.
3. Upgrade pip: `sudo pip3 install --upgrade pip`
4. Install Ansible: `pip3 install ansible`.
5. Add Ansible to your `$PATH`: `export PATH="$PATH:$HOME/Library/Python/3.9/bin"`
6. Clone or download this repository to your local drive.
7. Run `ansible-playbook main.yml --ask-become-pass` inside this directory.

## Special Thanks

To [Jeff Geerling](https://github.com/geerlingguy) for his [Mac Dev Playbook](https://github.com/geerlingguy/mac-dev-playbook), [Ansible Collection Mac](https://github.com/geerlingguy/ansible-collection-mac) and generally for all his contributions to the open source community.
