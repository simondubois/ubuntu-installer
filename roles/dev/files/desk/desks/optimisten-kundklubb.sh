# tf.sh
#
# Description: c4media project
#

PRJ_NAME=optimisten-kundklubb
PRJ_PATH="/var/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH

PATH=$(composer config bin-dir --absolute):$PATH
PATH=$(npm bin):$PATH

# Restore & migrate local database
dev-migratedb () {
    rm $PRJ_PATH/public/pictures/*.jpg
    dev-restoredb
    php ./artisan migrate --seed
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
