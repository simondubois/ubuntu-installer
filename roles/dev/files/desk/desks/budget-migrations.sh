# tf.sh
#
# Description: database migrations for budget project
#

PRJ_NAME=budget-migrations
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH

PATH=$PRJ_PATH/vendor/bin:$PATH

dev-run () {
    prod-downloaddb
    dev-restoredb
}

# Restore local database
dev-restoredb () {
    mysql -e "DROP DATABASE budget"
    mysql -e "CREATE DATABASE budget"
    mysql budget < "$PRJ_PATH/database.sql"
}

# Download production database
prod-downloaddb () {
    ssh dubandubois.com "mysqldump -hmqlb.myd.infomaniak.com mqlb_budget" > "$PRJ_PATH/database.sql"
}

