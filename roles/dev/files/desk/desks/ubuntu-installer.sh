# ubuntu-installer.sh
#
# Description: CLI to set up my personal Ubuntu system
#

PRJ_NAME=ubuntu-installer
PRJ_PATH="$HOME/www/$PRJ_NAME"

cd $PRJ_PATH

# Run ansible pull locally
browse() {
    xdg-open $PRJ_PATH
}

run() {
	ansible-pull -U git@github.com:simondubois/ubuntu-installer.git
}
