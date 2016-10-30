#/bin/bash

# Variables
PRJ_NAME=schroder-besiktningsrapport
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
    prod-downloaddb
    composer install
    dev-migratedb
    npm install
}

# Restore & migrate local database
dev-migratedb () {
    rm "$PRJ_PATH/storage/app/pictures"
    rm "$PRJ_PATH/storage/app/plans"
    dev-restoredb
    php artisan migrate --seed
    php artisan incidents:create --count=20
}

# Download staging database
prod-downloaddb () {
    ssh schroderst.se "mysqldump schroder_besiktningsrapport" > "$PRJ_PATH/storage/database.sql"
    rm "$PRJ_PATH/storage/app/pictures"
    rm "$PRJ_PATH/storage/app/plans"
    scp -r schroderst.se:/home/schroder/besiktningsrapport/storage/app/pictures "$PRJ_PATH/storage/app"
    scp -r schroderst.se:/home/schroder/besiktningsrapport/storage/app/plans "$PRJ_PATH/storage/app"
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH $DOCKER_IMAGE
