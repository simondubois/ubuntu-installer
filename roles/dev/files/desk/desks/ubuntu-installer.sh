# ubuntu-installer.sh
#
# Description: CLI to set up my personal Ubuntu system
#

cd ~/www/ubuntu-installer

# Install project into ~/www/ubuntu-installer
install() {
  ln -s ~/.ansible/pull/$HOSTNAME ~/www/ubuntu-installer
}
