
# Variables
PRJ_NAME=$1
PRJ_PATH=$2

export COMPOSER_DISABLE_XDEBUG_WARN=1
export HISTFILE=$HOME/.bash_history_$PRJ_NAME

cd $PRJ_PATH

# Browse development files
dev-browse () {
    xdg-open $PRJ_PATH
}
