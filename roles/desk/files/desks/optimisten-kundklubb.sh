#/bin/bash

# Variables
PRJ_NAME=optimisten-kundklubb
PRJ_PATH="$HOME/www/$PRJ_NAME"
DOCKER_IMAGE=$PRJ_NAME

# Deploy the application
dev-deploy () {
    git clone git@github.com:c4webbutveckling/$PRJ_NAME.git ./
    cp .env.example .env
    sed -i "/APP_KEY=/c\APP_KEY="`php -r 'echo md5(uniqid())."\n";'` .env
    sed -i "/DB_HOST=/c\DB_HOST=mysql" .env
    sed -i "/DB_DATABASE=/c\DB_DATABASE=$PRJ_NAME" .env
    sed -i "/DB_USERNAME=/c\DB_USERNAME=root" .env
    sed -i "/DB_PASSWORD=/c\DB_PASSWORD=" .env
    sed -i "/CACHE_DRIVER=/c\CACHE_DRIVER=file" .env
    sed -i "/SESSION_DRIVER=/c\SESSION_DRIVER=file" .env
	dev-restoredb
    composer install
    dev-migratedb
    npm install
}

# Restore & migrate local database
dev-migratedb () {
    rm $PRJ_PATH/public/pictures/*.jpg
    dev-restoredb
    php artisan -vvv migrate --seed
}

# SSH to production server
stag-ssh () {
    ssh optimisten.se.cust.c4hosting.se
}

# Pull production server
stag-migratedb () {
    ssh optimisten.se.cust.c4hosting.se "rm $PRJ_NAME/public/pictures/*.jpg"
    ssh optimisten.se.cust.c4hosting.se "php $PRJ_NAME/artisan migrate:refresh --seed"
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH $DOCKER_IMAGE
