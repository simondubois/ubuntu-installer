 #!/bin/bash

# Install ansible
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common ansible git python-apt -y

# Allow sudo without password
echo "%sudo ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ansible
sudo chown root:root /etc/sudoers.d/ansible
sudo chmod 0440 /etc/sudoers.d/ansible
