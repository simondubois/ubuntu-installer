
# Variables
PRJ_NAME=$1
PRJ_PATH=$2
DOCKER_IMAGE=$3

# Run docker
if [ ! -f /.dockerenv ]; then
    mkdir -p $PRJ_PATH

    STATUS=$(docker inspect --format="{{ .State.Running }}" $PRJ_NAME 2> /dev/null)

    if [ $? -eq 1 ]; then
        docker run -t -d \
          -p 80:80 \
          -v $PRJ_PATH:/var/www/html \
          -v $HOME/.bashrc:/home/docker/.bashrc \
          -v $HOME/.bash_aliases:/home/docker/.bash_aliases \
          -v $HOME/.bash_history_$PRJ_NAME:/home/docker/.bash_history_$PRJ_NAME \
          -v $HOME/.desk:/home/docker/.desk \
          -v $HOME/.ssh:/home/docker/.ssh \
	  --link mysql:mysql \
          --name $PRJ_NAME \
          simondubois/$DOCKER_IMAGE
    fi

    if [ "$STATUS" == "false" ]; then
        docker start $PRJ_NAME
    fi

    docker exec -ti $PRJ_NAME desk go $PRJ_NAME

    exit
fi

# Configure environment
PRJ_PATH=$PWD
export COMPOSER_DISABLE_XDEBUG_WARN=1
export HISTFILE=$HOME/.bash_history_$PRJ_NAME
export PATH=$(npm bin):$PATH
cd $PRJ_PATH

# Browse development files
dev-browse () {
    xdg-open $PRJ_PATH
}

# Run development version
dev-run () {
    xdg-open http://$PRJ_NAME.dev/ > /dev/null
}

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

# Scan dev website
dev-scan () {
    http-status-check scan http://$PRJ_NAME.dev/
}
