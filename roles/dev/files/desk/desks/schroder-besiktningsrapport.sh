# tf.sh
#
# Description: c4media project
#

PRJ_NAME=schroder-besiktningsrapport
PRJ_PATH="/var/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH

PATH=$(composer config bin-dir --absolute):$PATH
PATH=$(npm bin):$PATH

# Restore & migrate local database
dev-migratedb () {
    rm "$PRJ_PATH/storage/app/pictures"
    dev-restoredb
    php artisan migrate --seed
    php artisan incidents:create --count=20
}
