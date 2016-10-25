#/bin/bash

PRJ_NAME=simon
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/dubandubois.sh $PRJ_NAME $PRJ_PATH

export HISTFILE=$HOME/.bash_history_$PRJ_NAME

if [ ! -d "$PRJ_PATH" ]; then
    mkdir "$PRJ_PATH"
    git clone git@github.com:simondubois/$PRJ_NAME.git "$PRJ_PATH"
fi

cd "$PRJ_PATH"

# Open developement version of website
dev-run () {
  xdg-open "$PRJ_PATH/index.html"
}
