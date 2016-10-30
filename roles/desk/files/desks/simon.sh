#/bin/bash

# Variables
PRJ_NAME=simon
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/_dubandubois.sh $PRJ_NAME $PRJ_PATH

export HISTFILE=$HOME/.bash_history_$PRJ_NAME

# Deploy the application
dev-deploy() {
    git clone git@github.com:simondubois/$PRJ_NAME.git "$PRJ_PATH"
}

# Open developement version of website
dev-run () {
  xdg-open "$PRJ_PATH/index.html"
}

if [ ! -d "$PRJ_PATH" ]; then
    git config --global core.excludesfile ~/.gitignore_global
fi

cd "$PRJ_PATH"
