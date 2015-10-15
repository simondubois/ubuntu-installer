 #!/bin/bash

# Install ansible
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install software-properties-common ansible git -y

# Allow sudo without password
echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ansible
chown root:root /etc/sudoers.d/ansible
chmod 0440 /etc/sudoers.d/ansible

# Import github SSH key
mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Deploy playbooks
echo "localhost ansible_connection=local" | tee -a /etc/ansible/hosts
ansible-pull -o -U git://github.com/simondubois/ubuntu-installer.git
