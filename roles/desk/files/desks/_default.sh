#/bin/bash

# Variables
PRJ_NAME=$1
PRJ_PATH=$2
DOCKER_IMAGE=$3

# History file
export HISTFILE=$HOME/.bash_history_$PRJ_NAME
touch $HISTFILE

# Configure environment
export COMPOSER_DISABLE_XDEBUG_WARN=1

# Update PATH
if hash npm 2> /dev/null; then
    export PATH=$(npm bin 2> /dev/null):$PATH
fi

# Update PATH
if hash composer 2> /dev/null; then
    export PATH=$(composer config bin-dir --absolute):$PATH
fi

# Run docker container
if ! hash dev-docker-run 2> /dev/null; then
    dev-docker-run () {
        docker run -t -d \
          -p 80:80 \
          -v $PRJ_PATH:/var/www/html \
          -v $HOME/.bashrc:/home/docker/.bashrc \
          -v $HOME/.bash_aliases:/home/docker/.bash_aliases \
          -v $HISTFILE:/home/docker/.bash_history_$PRJ_NAME \
          -v $HOME/.desk:/home/docker/.desk \
          -v $HOME/.ssh:/home/docker/.ssh \
          --link mysql:mysql \
          --name $PRJ_NAME \
          simondubois/$DOCKER_IMAGE
    }
fi

# Restore local database
dev-restoredb () {
    mysql -e "DROP DATABASE \`$PRJ_NAME\`"
    mysql -e "CREATE DATABASE \`$PRJ_NAME\`"
    if [ -f "$PRJ_PATH/storage/database.sql" ]
    then
        mysql $PRJ_NAME < "$PRJ_PATH/storage/database.sql"
    fi
}

# Restore & migrate local database
dev-migratedb () {
    dev-restoredb
    php artisan migrate --seed
}

# If inside docker container
if [ ! -f /.dockerenv ]; then
    mkdir -p $PRJ_PATH

    STATUS=$(docker inspect --format="{{ .State.Running }}" $PRJ_NAME 2> /dev/null)

    if [ $? -eq 1 ]; then
        dev-docker-run
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

# First run
if [ ! -d "$PRJ_PATH/.git" ]
then
    dev-deploy
fi
