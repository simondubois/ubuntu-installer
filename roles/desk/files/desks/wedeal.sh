#/bin/bash

# Variables
PRJ_NAME=wedeal
PRJ_PATH="$HOME/www/$PRJ_NAME"
DOCKER_IMAGE=$PRJ_NAME

# Deploy the application
dev-deploy () {
    git clone git@github.com:c4webbutveckling/$PRJ_NAME.git ./ -b dev-bugfixes
    cp .env.example .env
    sed -i "/APP_KEY=/c\APP_KEY="`php -r 'echo md5(uniqid())."\n";'` .env
    sed -i "/DB_HOST=/c\DB_HOST=mysql" .env
    sed -i "/DB_DATABASE=/c\DB_DATABASE=$PRJ_NAME" .env
    sed -i "/DB_USERNAME=/c\DB_USERNAME=root" .env
    sed -i "/DB_PASSWORD=/c\DB_PASSWORD=" .env
    sed -i "/CACHE_DRIVER=/c\CACHE_DRIVER=file" .env
    sed -i "/SESSION_DRIVER=/c\SESSION_DRIVER=file" .env
    stag-downloaddb
    dev-restoredb
    composer install
    npm install
}

# Download staging database
stag-downloaddb () {
    ssh wedeal.se.cust.c4hosting.se "mysqldump wedeal_system" > "$PRJ_PATH/storage/database.sql"
    rm "$PRJ_PATH/public/uploads"
    scp -r wedeal.se.cust.c4hosting.se:/home/wedeal/project/public/uploads "$PRJ_PATH/public"
}

# Restore & migrate local database
dev-migratedb () {
    dev-restoredb
    php artisan migrate --seed
    php artisan images:detect-missing --fix
    php artisan classifications:detect-missing --fix
}

# Scan webpages
stag-scanpages () {
    /var/www/http-status-check/vendor/bin/http-status-check scan http://wedeal.se.cust.c4hosting.se/
}

# Scan webpages
dev-scanpages () {
    /var/www/http-status-check/vendor/bin/http-status-check scan http://wedeal.dev
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH $DOCKER_IMAGE
