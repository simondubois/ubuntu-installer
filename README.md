
# ubuntu-installer

<p align="center">
<img src="https://raw.githubusercontent.com/simondubois/ubuntu-installer/v1/screenshot.png" alt="Ubuntu logo" title="Ubuntu logo" style="max-width:100%;"><br>
CLI to set up my personal Ubuntu system
</p>


## Roles

| Name | Summary | Parameters |
| --- | --- | --- |
| system | system wide configuration | none |
| owncloud | owncloud sync setup | none |
| web | web applications | - trello_username (username to use for landing page) |
| media | media applications | none |
| desktop | desktop settings | - theme_in_use (Gtk theme to set as active)<br>- icons_in_use (icon theme to set as active)<br>- background_options (how background is resized)<br>- background_uri (path to background file)<br>- custom_compiz ( array of compiz settings)<br>- custom_unity ( array of unity settings)<br> |
| dev | development environment | - root_path (path where to glone projects)<br>- repositories (git repositories to clone into path) |
| core | core settings | - startup_enabled (array of desktop file to launch on session start) |


## Usage

1. Set your hostname to match one of the .yml file at the root of the repository.

2. Install ansible :

```Shell

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common ansible git python-apt -y

```

3. Allow sudo without password for ansible :

```Shell

echo "%sudo ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansible
sudo chown root:root /etc/sudoers.d/ansible
sudo chmod 0440 /etc/sudoers.d/ansible

```

4. Deploy and execute this repository :

```Shell

ansible-pull -U https://github.com/simondubois/ubuntu-installer.git

```

## To be installed manually

- private PPAs (https://software-center.ubuntu.com/subscriptions/).
- intel-linux-graphics-installer
- steam

## To be configured manually (post install)

- chromium-browser
- thunderbird
- skype
- kodi

## Known issues

 - **Script fails after "TASK [system : update sources]".** This is due to upgrade of ansible package while ansible is running. Just restart the deployment with ansible-pull to continue.
