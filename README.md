
# unsplash-downloader

![Ubuntu logo](https://raw.githubusercontent.com/simondubois/ubuntu-installer/master/screenshot.png  "Ubuntu logo")

[WIP] CLI to set up my personal Ubuntu system

## Status

This application is currently under development :

- [x] Project setup
- [x] System role
- [x] Core applications roles
- [x] Web applications roles
- [x] Dev applications roles
- [x] Media applications roles
- [ ] Unity role

## Usage

1. Set your hostname to match one of the .yml file at the root of the repository.

2. Configure your computer for ansible-pull :

```Shell

wget https://raw.githubusercontent.com/simondubois/ubuntu-installer/master/install/install.sh -O /tmp/ansible.sh && bash /tmp/ansible.sh

```

3. Deploy this repository

```Shell

ansible-pull -U git://github.com/simondubois/ubuntu-installer.git

```

## To be installed manually

- intel-linux-graphics-installer
- steam

## To be configured manually

- sublime-text (just restard the application to load packages)
- chromium-browser (just sign in to sync)
- skype (just login and)
- kodi (no setup supported)

## Known issues

 - **Script fails on first run on fresh install.** This is due to ansible package update when running. Just restart the deployment with ansible-pull to continue.
