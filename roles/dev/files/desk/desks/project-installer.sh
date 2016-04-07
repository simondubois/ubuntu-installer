# project-installer.sh
#
# Description: CLI to deploy project for development
#

PRJ_NAME=project-installer
PRJ_PATH="$HOME/www/$PRJ_NAME"

cd $PRJ_PATH

# Run ansible pull locally
browse() {
    xdg-open $PRJ_PATH
}

run() {
    root=$HOME/www
    path=$root/$1
    paths=($(ls -d $root/*))
    if [ -z "$1" ]; then
        echo "Available projects :"
        printf '\tall (run all projects)\n'
        printf '\t%s\n' "${paths[@]##*/}"
    elif [ "$1" = "all" ]; then
        for path in "${paths[@]}"
        do :
            run ${path##*/}
        done
    elif [ ! -d "$path" ]; then
        echo "Path $path nonexistent."
        run
    else
        url=`git -C $path config --get remote.origin.url`
        ansible-pull -U https://github.com/simondubois/project-installer.git \
            -e "git_repository=$url git_destination=$path" \
            -d "/tmp/project-installer"
    fi
}
