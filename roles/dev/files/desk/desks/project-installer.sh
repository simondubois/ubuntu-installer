# project-installer.sh
#
# Description: CLI to deploy project for development
#

PRJ_NAME=project-installer
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH

# List projects
list() {
    if [ -z "$1" ]; then
        root=$HOME/www
    else
        root=$1
    fi

    paths=($(ls -d $root/*))
    printf '%s\n' "${paths[@]}"
}

# Execute git command on projects
git-all() {
    root=$HOME/www

    paths=($(ls -d $root/*))

    for path in "${paths[@]}"
    do :
        echo -ne "${BLUE}\0342\0227\0262 $(basename $path)${NC}\n"
        git -C $path $0
        echo ""
    done
}

# Run ansible pull on projects
run() {
    if [ -z "$1" ]; then
        root=$HOME/www
    else
        root=$1
    fi

    if [ -d "$root/.git" ]; then
        url=`git -C $root config --get remote.origin.url`
        ansible-pull -U https://github.com/simondubois/project-installer.git \
            -e "git_repository=$url git_destination=$root" \
            -d "/tmp/project-installer"
    else
        paths=($(list $root))
        for path in "${paths[@]}"
        do :
            run $path
        done
    fi
}
