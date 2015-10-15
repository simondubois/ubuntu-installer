 #!/bin/bash

# Install ansible
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common ansible git -y

# Allow sudo without password
echo "%sudo ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansible
sudo chown root:root /etc/sudoers.d/ansible
sudo chmod 0440 /etc/sudoers.d/ansible

# Import github SSH key
mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Deploy playbooks
echo "localhost ansible_connection=local" | sudo tee -a /etc/ansible/hosts
ansible-pull -o -U git://github.com/simondubois/ubuntu-installer.git
