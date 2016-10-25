#/bin/bash

PRJ_NAME=ubuntu-installer
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/dubandubois.sh $PRJ_NAME $PRJ_PATH

export HISTFILE=$HOME/.bash_history_$PRJ_NAME

if [ ! -e "$PRJ_PATH" ]; then
    ln -s "$HOME/.ansible/pull/simon-laptop" "$PRJ_PATH"
    cd "$PRJ_PATH"
    git remote set-url origin git@github.com:simondubois/$PRJ_NAME.git
fi

cd "$PRJ_PATH"
