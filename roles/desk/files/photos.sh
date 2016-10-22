# tf.sh
#
# Description: private one photo a day in your browser
#

PRJ_NAME=photos
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/dubandubois.sh $PRJ_NAME $PRJ_PATH

PATH=$(npm bin):$PATH

dev-restorephotos() {
    rm $PRJ_PATH/storage/app/photos
    php $PRJ_PATH/artisan import:photos ~/Pictures/Élie\ quotidien/
}
