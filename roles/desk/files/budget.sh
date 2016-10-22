# tf.sh
#
# Description: online envelope system money to keep a budget under control
#

PRJ_NAME=budget
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/dubandubois.sh $PRJ_NAME $PRJ_PATH

PATH=$(npm bin):$PATH

# Restore local database
dev-migratedb () {
    replace "/*!40103 SET TIME_ZONE='+00:00' */;" "/*!40103 SET TIME_ZONE='-02:00' */;" -- "$PRJ_PATH/storage/database.sql"
    dev-restoredb
    php artisan accounts:delete 5
    php artisan users:delete -e 1
    php artisan migrate --seed
}
