#/bin/bash

# Variables
PRJ_NAME=$1
PRJ_PATH=$2
PRJ_BRAN=$3

# Deploy the application
dev-deploy () {
    git clone git@github.com:c4webbutveckling/ebutik.git ./ -b $PRJ_BRAN  --single-branch
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
    mkdir -p $PRJ_NAME/tpl/default/smarty/templates_c
    dev-restoredb
    npm install
    prod-downloadfiles
}

source ~/.desk/desks/_default.sh $PRJ_NAME $PRJ_PATH ebutik
