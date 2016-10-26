#/bin/bash

# Variables
PRJ_NAME=c4media-test
PRJ_PATH="$HOME/www/$PRJ_NAME"
DOCKER_IMAGE=$PRJ_NAME

source ~/.desk/desks/_dubandubois.sh $PRJ_NAME $PRJ_PATH

# Deploy the application
dev-deploy () {
    git clone git@github.com:simondubois/$PRJ_NAME.git ./
    composer install
    cp .env.example .env
    sed -i "/APP_KEY=/c\APP_KEY="`php -r 'echo md5(uniqid())."\n";'` .env
    sed -i "/DB_HOST=/c\DB_HOST=mysql" .env
    sed -i "/DB_DATABASE=/c\DB_DATABASE=$PRJ_NAME" .env
    sed -i "/DB_USERNAME=/c\DB_USERNAME=root" .env
    sed -i "/DB_PASSWORD=/c\DB_PASSWORD=" .env
    sed -i "/CACHE_DRIVER=/c\CACHE_DRIVER=file" .env
    sed -i "/SESSION_DRIVER=/c\SESSION_DRIVER=file" .env
    dev-migratedb
    npm install
}

# Restore production database
prod-restoredb () {
    ssh dubandubois.com "php-7.0 dubandubois.com/$PRJ_NAME/artisan migrate:refresh --seed"
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH $DOCKER_IMAGE
