
# ubuntu-installer

<p align="center">
<img src="https://raw.githubusercontent.com/simondubois/ubuntu-installer/v2/screenshot.png" alt="Ubuntu logo" title="Ubuntu logo" style="max-width:100%;"><br>
CLI to set up my personal Ubuntu system
</p>

## How to install

1. Install [Ubuntu 14.04](http://releases.ubuntu.com/14.04/).

2. Set hostname to match one of the .yml file at the root of the repository.

3. Update repository sources from GUI.

4. Install ansible :

```Shell
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common ansible git python-apt -y
```

5. Allow sudo without password for ansible :

```Shell
echo "%sudo ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansible
sudo chown root:root /etc/sudoers.d/ansible
sudo chmod 0440 /etc/sudoers.d/ansible
```

## How to run

```Shell
ansible-pull -U https://github.com/simondubois/ubuntu-installer.git
```

## To be done manually

- configure Thunderbird.
- log in Chromium.
- log in Slack.
- log in Trello.
- log in Skype.
- install & configure Steam.
- configure Kodi.
- calibrate power-tool.
