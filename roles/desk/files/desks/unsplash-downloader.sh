#/bin/bash

# Variables
PRJ_NAME=unsplash-downloader
PRJ_PATH="$HOME/www/$PRJ_NAME"
DOCKER_IMAGE=$PRJ_NAME

# Run docker container
dev-docker-run() {
    docker run -t -d \
      -v $PRJ_PATH:/home/docker/unsplash-downloader \
      -v $HOME/Pictures/wallpapers/unsplash.com/:/home/docker/unsplash-wallpapers \
      -v $HOME/.bashrc:/home/docker/.bashrc \
      -v $HOME/.bash_aliases:/home/docker/.bash_aliases \
      -v $HOME/.bash_history_$PRJ_NAME:/home/docker/.bash_history_$PRJ_NAME \
      -v $HOME/.desk:/home/docker/.desk \
      -v $HOME/.ssh:/home/docker/.ssh \
      --name $PRJ_NAME \
      simondubois/$DOCKER_IMAGE
}

# Deploy the application
dev-deploy () {
    git clone git@github.com:simondubois/$PRJ_NAME.git ./
    composer install
}

# Build phar file
build() {
    php $PRJ_PATH/create-phar.php
}

# Download photos to Pictures
prod-download() {
    path=~/unsplash-wallpapers
    php $PRJ_PATH/build/$PRJ_NAME --featured --destination $path --history $path/history.txt --quantity 100
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH $DOCKER_IMAGE
