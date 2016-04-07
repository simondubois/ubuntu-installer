# tf.sh
#
# Description: e-commerce work sample for C4Media
#

PRJ_NAME=c4media-test
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/dubandubois.sh $PRJ_NAME $PRJ_PATH

cd $PRJ_PATH

# Restore local database
dev-restoredb () {
    mysql -e "DROP DATABASE \`$PRJ_NAME\`"
    mysql -e "CREATE DATABASE \`$PRJ_NAME\`"
    $PRJ_PATH/artisan migrate:refresh --seed
}

# Restore production database
prod-restoredb () {
    ssh dubandubois.com "php-7.0 dubandubois.com/$PRJ_NAME/artisan migrate:refresh --seed"
}
