#!/bin/bash

# Install ansible
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

# Clone repository
ansible -i "localhost," -c local -m apt -a "name=git state=latest"
ansible -i "localhost," -c local -m git -a "repo=git://git@github.com:simondubois/ubuntu-installer.git dest=$HOME/ubuntu-installer version=HEAD"
