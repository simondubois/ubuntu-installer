#/bin/bash

# Variables
PRJ_NAME=lampgrossen
PRJ_PATH="$HOME/www/$PRJ_NAME"
PRJ_BRAN=theme-lampgrossen

# Download production database
prod-downloadfiles () {
    rm "$PRJ_PATH/uploads"
    scp -r lampgrossen.se:/home/lampgros/public_html/uploads "$PRJ_PATH"
}

source ~/.desk/desks/_ebutik.sh $PRJ_NAME $PRJ_PATH $PRJ_BRAN
