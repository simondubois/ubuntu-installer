# tf.sh
#
# Description: development environment for mysup.fr
#

PRJ_NAME=mysup
PRJ_PATH=/var/www/$PRJ_NAME

WWW_HOST=$PRJ_NAME.fr

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH
source ~/.desk/desks/web.sh $PRJ_NAME $PRJ_PATH

# Restore local database
dev-restoredb () {
	mysql -e "DROP DATABASE $PRJ_NAME"
	mysql -e "CREATE DATABASE $PRJ_NAME"
	mysql $PRJ_NAME < $PRJ_PATH/fuel/app/sql/lea_prod.sql
	mysql $PRJ_NAME < $PRJ_PATH/queries.sql
}

# SSH to production server
prod-ssh () {
    ssh $WWW_HOST
}

# FTP to production server
www-browse () {
    filezilla -c 0/pimenteo/$WWW_HOST &
}

# Open production version of website
www-run () {
	xdg-open http://$WWW_HOST/ > /dev/null
}

# Pull production server
www-pull () {
  	ssh $WWW_HOST "git --git-dir /home/webadmin/web/www.$WWW_HOST/.git --work-tree /home/webadmin/web/www.$WWW_HOST pull"
}

# Download production database
www-downloaddb () {
	ssh $WWW_HOST "mysqldump $PRJ_NAME" > $PRJ_PATH/fuel/app/sql/lea_prod.sql
}
