
# Variables
PRJ_NAME=$1
PRJ_PATH=$2

# Run development version
dev-run () {
    xdg-open http://$PRJ_NAME.dev/ > /dev/null
}

# Restore local database
dev-restoredb () {
	mysql -e "DROP DATABASE \`$PRJ_NAME\`"
	mysql -e "CREATE DATABASE \`$PRJ_NAME\`"
    if [ -f "$PRJ_PATH/storage/database.sql" ]
    then
    	mysql $PRJ_NAME < "$PRJ_PATH/storage/database.sql"
    fi
}

# Restore & migrate local database
dev-migratedb () {
    dev-restoredb
    php artisan migrate --seed
}

# Scan dev website
dev-scan () {
    http-status-check scan http://$PRJ_NAME.dev/
}
