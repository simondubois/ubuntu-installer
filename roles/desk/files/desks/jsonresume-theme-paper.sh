#/bin/bash

# Variables
PRJ_NAME=jsonresume-theme-paper
PRJ_PATH="$HOME/www/$PRJ_NAME"
DOCKER_IMAGE=$PRJ_NAME

# Run docker container
dev-docker-run() {
    docker run -t -d \
      -p 80:4000 \
      -v $PRJ_PATH:/usr/src/app \
      -v $HOME/.bashrc:/home/docker/.bashrc \
      -v $HOME/.bash_aliases:/home/docker/.bash_aliases \
      -v $HISTFILE:/home/docker/.bash_history_$PRJ_NAME \
      -v $HOME/.desk:/home/docker/.desk \
      -v $HOME/.gitignore_global:/home/docker/.gitignore_global \
      -v $HOME/.ssh:/home/docker/.ssh \
      -w /usr/src/app \
      --name $PRJ_NAME \
      simondubois/$DOCKER_IMAGE
}

# Deploy the application
dev-deploy() {
    git clone git@github.com:simondubois/$PRJ_NAME.git ./
    npm install
}

run-simon() {
    ln -fs "$PRJ_PATH/resume.simon.json" "$PRJ_PATH/resume.json"
    resume serve
}

run-delphine() {
    ln -fs "$PRJ_PATH/resume.delphine.json" "$PRJ_PATH/resume.json"
    resume serve
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH $DOCKER_IMAGE
