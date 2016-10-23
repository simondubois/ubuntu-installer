# tf.sh
#
# Description: a theme for JSON Resume
#

PRJ_NAME=jsonresume-theme-paper
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH

PATH=$(npm bin):$PATH

run-simon() {
    ln -fs "$PRJ_PATH/resume.simon.json" "$PRJ_PATH/resume.json"
    resume serve
}

run-delphine() {
    ln -fs "$PRJ_PATH/resume.delphine.json" "$PRJ_PATH/resume.json"
    resume serve
}
