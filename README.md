
# ubuntu-installer

<p align="center">
<img src="https://raw.githubusercontent.com/simondubois/ubuntu-installer/master/screenshot.png" alt="Ubuntu logo" title="Ubuntu logo" style="max-width:100%;">
CLI to set up my personal Ubuntu system
</p>


## Roles

| Name | Summary | Parameters |
| --- | --- | --- |
| system | system wide configuration | none |
| owncloud | owncloud sync setup | none |
| web | web applications | none |
| dev | development environment | none |
| media | media applications | none |
| desktop | desktop settings | - theme_in_use (Gtk theme to set as active)<br>- icons_in_use (icon theme to set as active)<br>- background_options (how background is resized)<br>- background_uri (path to background file)<br>- custom_compiz ( array of compiz settings)<br>- custom_unity ( array of unity settings)<br> |
| media | media applications | none |
| core | core settings | - startup_enabled (array of desktop file to launch on session start) |


## Usage

1. Set your hostname to match one of the .yml file at the root of the repository.

2. Configure your computer for ansible-pull :

```Shell

wget https://raw.githubusercontent.com/simondubois/ubuntu-installer/master/install/install.sh -O /tmp/ansible.sh && bash /tmp/ansible.sh

```

3. Deploy this repository with one of the following commands :

```Shell

ansible-pull -U git://github.com/simondubois/ubuntu-installer.git # public access
ansible-pull -U git@github.com:simondubois/ubuntu-installer.git # credentials required

```

## To be installed manually

- intel-linux-graphics-installer
- steam

## To be configured manually (post install)

- chromium-browser
- thunderbird
- skype
- kodi

## Known issues

 - **Script fails after "TASK [system : update sources]".** This is due to upgrade of ansible package while ansible is running. Just restart the deployment with ansible-pull to continue.
