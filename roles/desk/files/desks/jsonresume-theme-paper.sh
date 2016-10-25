#/bin/bash

# Variables
PRJ_NAME=jsonresume-theme-paper
PRJ_PATH="$HOME/www/$PRJ_NAME"
DOCKER_IMAGE=$PRJ_NAME

# Run docker
if [ ! -f /.dockerenv ]; then
    mkdir -p $PRJ_PATH

    STATUS=$(docker inspect --format="{{ .State.Running }}" $PRJ_NAME 2> /dev/null)

    if [ $? -eq 1 ]; then
        docker run -t -d \
          -p 80:4000 \
          -v $PRJ_PATH:/usr/src/app \
          -v $HOME/.bashrc:/home/docker/.bashrc \
          -v $HOME/.bash_aliases:/home/docker/.bash_aliases \
          -v $HOME/.bash_history_$PRJ_NAME:/home/docker/.bash_history_$PRJ_NAME \
          -v $HOME/.desk:/home/docker/.desk \
          -v $HOME/.ssh:/home/docker/.ssh \
          -w /usr/src/app \
          --name $PRJ_NAME \
          simondubois/$DOCKER_IMAGE
        atom -a $PRJ_PATH
    fi

    if [ "$STATUS" == "false" ]; then
        docker start $PRJ_NAME
    fi

    docker exec -ti $PRJ_NAME desk go $PRJ_NAME

    exit
fi

# Configure environment
export PRJ_PATH=$PWD
export PATH=$(npm bin):$PATH
export HISTFILE=$HOME/.bash_history_$PRJ_NAME

# Deploy the application
dev-deploy () {
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
