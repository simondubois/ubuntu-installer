
# Variables
PRJ_NAME=$1
PRJ_PATH=$2

# Run development version
dev-run () {
    xdg-open http://$PRJ_NAME.dev/ > /dev/null
}

# Restore local database
dev-restoredb () {
    echo "DROP DATABASE \`$PRJ_NAME\`"
	mysql -e "DROP DATABASE \`$PRJ_NAME\`"
	mysql -e "CREATE DATABASE \`$PRJ_NAME\`"
	mysql $PRJ_NAME < "$PRJ_PATH/storage/database.sql"
}
