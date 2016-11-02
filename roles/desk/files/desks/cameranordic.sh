#/bin/bash

# Variables
PRJ_NAME=cameranordic
PRJ_PATH="$HOME/www/$PRJ_NAME"
PRJ_BRAN=theme-cameranordic-2014

# Download production database
prod-downloadfiles () {
    rm "$PRJ_PATH/uploads"
    scp -r cameranordic.se:/home/???/???/uploads "$PRJ_PATH"
    git checkout "$PRJ_PATH/uploads"
}

source ~/.desk/desks/_ebutik.sh $PRJ_NAME $PRJ_PATH $PRJ_BRAN
