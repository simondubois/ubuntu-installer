
# unsplash-downloader

![Ubuntu logo](https://raw.githubusercontent.com/simondubois/ubuntu-installer/master/screenshot.png  "Ubuntu logo")

CLI to set up my personal Ubuntu system


## Roles

### system
System wide configuration.
No parameters.

### owncloud
Owncloud sync setup.
No parameters.

### web
Web applications.
No parameters.

### dev
Development environment
No settings.

### media
Media applications
No parameters.

### desktop
Desktop settings.
Parameters are :
    - theme_in_use (Gtk theme to set as active).
    - icons_in_use (icon theme to set as active).
    - background_options (how background is resized).
    - background_uri (path to background file).
    - custom_compiz ( array of compiz settings).

### core
Core settings.
Parameter is :
    - startup_enabled (array of desktop file to launch on session start).


## Usage

1. Set your hostname to match one of the .yml file at the root of the repository.

2. Configure your computer for ansible-pull :

```Shell

wget https://raw.githubusercontent.com/simondubois/ubuntu-installer/master/install/install.sh -O /tmp/ansible.sh && bash /tmp/ansible.sh

```

3. Deploy this repository

```Shell

ansible-pull -U git@github.com:simondubois/ubuntu-installer.git

```

## To be installed manually

- intel-linux-graphics-installer
- steam

## To be configured manually (post install)

- chromium-browser (just sign in to sync)
- filezilla
- thunderbird
- skype
- kodi
- custom folders icons :
    - ``gvfs-set-attribute ~/www metadata::custom-icon-name network``

## Known issues

 - **Script fails after "TASK [system : update sources]".** This is due to upgrade of ansible package while ansible is running. Just restart the deployment with ansible-pull to continue.
