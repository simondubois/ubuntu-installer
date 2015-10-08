#!/bin/bash

# Install ansible
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common ansible git -y

# Clone repository
mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone git://github.com/simondubois/ubuntu-installer.git

# Deploy installation
cd ubuntu-installer
