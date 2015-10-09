
# unsplash-downloader

CLI to set up my personal Ubuntu system

## Usage

On a fresh Ubuntu (14.04) installation, run :

```Shell

# Install ansible
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common ansible git -y

# Deploy playbook
ansible-pull -o -U git://github.com/simondubois/ubuntu-installer.git

```
