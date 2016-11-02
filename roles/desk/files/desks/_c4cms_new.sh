#/bin/bash

# Variables
PRJ_NAME=$1
PRJ_PATH=$2
PRJ_BRAN=$3

# Deploy the application
dev-deploy () {
    git clone git@github.com:c4webbutveckling/c4cms_new.git ./ -b $PRJ_BRAN  --single-branch
    chmod a+w -R $PRJ_PATH/uploads
    cat > $PRJ_PATH/inc/config.inc.php <<EOL
<?php
\$_SQL = array(
    'host' => 'mysql',
    'user' => 'root',
    'pass' => '',
    'base' => '$PRJ_NAME',
);
define('URL', 'http://localhost/');
EOL
    dev-restoredb
    npm install
    prod-downloadfiles
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH c4cms_new
