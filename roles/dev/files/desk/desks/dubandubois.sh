
# Variables
PRJ_NAME=$1
PRJ_PATH=$2

# FTP to production server
prod-browse () {
    filezilla -c 0/dubandubois.com/$PRJ_NAME &
}

# Open production version of website
prod-run () {
  xdg-open http://$PRJ_NAME.dubandubois.com/ > /dev/null
}

# SSH to production server
prod-ssh () {
    ssh dubandubois.com
}

# Pull production server
prod-pull () {
  	ssh dubandubois.com "git --git-dir dubandubois.com/$PRJ_NAME/.git pull"
}

# Download production database
prod-downloaddb () {
	ssh dubandubois.com "mysqldump -hmqlb.myd.infomaniak.com mqlb_$PRJ_NAME" > "$PRJ_PATH/storage/database.sql"
}
