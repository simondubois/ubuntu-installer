#/bin/bash

PRJ_NAME=budget
PRJ_PATH="$HOME/www/$PRJ_NAME"
DOCKER_IMAGE=$PRJ_NAME

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH $DOCKER_IMAGE
source ~/.desk/desks/dubandubois.sh $PRJ_NAME $PRJ_PATH

# Deploy the application
dev-deploy () {
    git clone git@github.com:simondubois/budget.git -b v2 ./
    composer install
    cp .env.example .env
    sed -i "/APP_KEY=/c\APP_KEY="`php -r 'echo md5(uniqid())."\n";'` .env
    sed -i "/DB_HOST=/c\DB_HOST=mysql" .env
    sed -i "/DB_DATABASE=/c\DB_DATABASE=$PRJ_NAME" .env
    sed -i "/DB_USERNAME=/c\DB_USERNAME=root" .env
    sed -i "/DB_PASSWORD=/c\DB_PASSWORD=" .env
    php artisan migrate
    prod-downloaddb
    dev-migratedb
    npm install
}

# Restore local database
dev-migratedb () {
    replace "/*!40103 SET TIME_ZONE='+00:00' */;" "/*!40103 SET TIME_ZONE='-02:00' */;" -- "$PRJ_PATH/storage/database.sql"
    dev-restoredb
    php artisan accounts:delete 5
    php artisan users:delete -e 1
    php artisan migrate --seed
}
