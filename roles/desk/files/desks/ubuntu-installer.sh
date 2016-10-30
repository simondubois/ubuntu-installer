#/bin/bash

# Variables
PRJ_NAME=ubuntu-installer
PRJ_PATH="$HOME/www/$PRJ_NAME"

export HISTFILE=$HOME/.bash_history_$PRJ_NAME

# Deploy the application
dev-deploy() {
    ln -s "$HOME/.ansible/pull/simon-laptop" "$PRJ_PATH"
    cd "$PRJ_PATH"
    atom -a $PRJ_PATH
}

prod-run() {
    time ansible-pull -U https://github.com/simondubois/ubuntu-installer.git -C v2
    git remote set-url origin git@github.com:simondubois/$PRJ_NAME.git
}

if [ ! -d "$PRJ_PATH" ]; then
    dev-deploy
fi

cd "$PRJ_PATH"
git remote set-url origin git@github.com:simondubois/$PRJ_NAME.git
