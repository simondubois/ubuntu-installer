# ubuntu-installer.sh
#
# Description: CLI to set up my personal Ubuntu system
#

PRJ_NAME=ubuntu-installer
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH

# Run ansible-pull
run() {
	ansible-pull -U git@github.com:simondubois/ubuntu-installer.git
}
