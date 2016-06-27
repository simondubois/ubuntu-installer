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

# Restore local database
dev-migratedb () {
    dev-restoredb
    php artisan migrate --seed
}
