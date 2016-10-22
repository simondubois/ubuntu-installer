# tf.sh
#
# Description: c4media project
#

PRJ_NAME=wedeal
PRJ_PATH="/var/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH

PATH=$(npm bin):$PATH

# Download production database
prod-downloaddb () {
    echo "Not implemented"
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
