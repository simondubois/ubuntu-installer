# tf.sh
#
# Description: c4media project
#

PRJ_NAME=ebutik
PRJ_PATH="/var/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH

PATH=$(npm bin):$PATH

# Download production database
prod-downloaddb () {
    mkdir -p "$PRJ_PATH/storage"
    ssh tjornarpsbuss.se "mysqldump tjornarp_butik5" > "$PRJ_PATH/storage/database.sql"
    rm "$PRJ_PATH/uploads"
    scp -r tjornarpsbuss.se:/home/tjornarpsbuss/public_html/uploads "$PRJ_PATH"
}
