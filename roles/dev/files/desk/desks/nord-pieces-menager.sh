# tf.sh
#
# Description: development environment for nord-pieces-menager.fr
#

PRJ_NAME=nord-pieces-menager
PRJ_PATH=/var/www/$PRJ_NAME
DEV_HOST=$PRJ_NAME.fr

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH

PATH=$(npm bin):$PATH
