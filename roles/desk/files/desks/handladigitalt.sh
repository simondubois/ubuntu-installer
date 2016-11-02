#/bin/bash

# Variables
PRJ_NAME=handladigitalt
PRJ_PATH="$HOME/www/$PRJ_NAME"
PRJ_BRAN=theme-handladigitalt

# Download production database
prod-downloadfiles () {
    rm "$PRJ_PATH/uploads"
    scp -r handladigitalt.se.cust.c4hosting.se:/home/handladigitalt/public_html/uploads "$PRJ_PATH"
    git checkout "$PRJ_PATH/uploads"
}

source ~/.desk/desks/_ebutik.sh $PRJ_NAME $PRJ_PATH $PRJ_BRAN
