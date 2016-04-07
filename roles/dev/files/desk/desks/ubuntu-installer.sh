# ubuntu-installer.sh
#
# Description: CLI to set up my personal Ubuntu system
#

cd ~/www/ubuntu-installer

# Run ansible pull locally
run() {
	ansible-pull -U git@github.com:simondubois/ubuntu-installer.git
}
