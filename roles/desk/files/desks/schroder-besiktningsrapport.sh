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
