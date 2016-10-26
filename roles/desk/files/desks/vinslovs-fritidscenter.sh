#/bin/bash

# Variables
PRJ_NAME=vinslovs-fritidscenter
PRJ_PATH="$HOME/www/$PRJ_NAME"
PRJ_BRAN=theme-fritidcenter

# Download production database
prod-downloadfiles () {
    rm "$PRJ_PATH/uploads"
    scp -r dev.vinslovs-fritidscenter.se.cust.c4hosting.se:/home/vinslovs/dev.vinslovs-fritidscenter.se/uploads "$PRJ_PATH"
}

source ~/.desk/desks/_c4cms_new.sh $PRJ_NAME $PRJ_PATH $PRJ_BRAN
