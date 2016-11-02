
#
# Basic shell
#

alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'

alias rm='trash-put'

alias nano='nano -u -c -w -E -T 4'
alias n='nautilus'

alias mysql="mysql -h mysql -u root"
alias mysqldump="mysqldump -h mysql -u root"



#
# Media handling
#

alias rss-update='ssh dubandubois.com "php-5.6 dubandubois.com/cloud/cron.php"'

alias mp3bitratecheck='find . -name "*.mp3" -exec mp3info -r a -p "\"{}\"\t%r\n" "{}" \; | grep -v "1[1-3][0-9]."'
alias mp3bitrateconvert='for f in *.mp3; do avconv -i "$f" -c:a libmp3lame -b:a 128k "${f%.*}2.mp3"; done'

video-encode() { avconv -i "$1" -strict experimental ~/$1.mp4; }
video-rotate() { avconv -i "$1" -vf transpose=1 -strict experimental ~/$1.mp4; }



#
# Development environment
#

# # Refresh slideshow in Pictures
# prod-refresh() {
#     cd ~/Pictures/wallpapers/unsplash.com
#     sudo python slideshowBuilder.py
#     cd -
# }

# alias projects-git='desk run project-installer git-all'
# alias projects-status='projects-git "status -sb"'

# git-all() {
#     paths=($(ls -d $HOME/www/* /var/www/*))

#     for path in "${paths[@]}"
#     do :
#         echo -ne "${BLUE}\0342\0227\0262 $(basename $path)${NC}\n"
#         git -C $path $0
#         echo ""
#     done
# }

# # Run ansible pull on projects
# run() {
#     if [ -z "$1" ]; then
#         root=$HOME/www
#     else
#         root=$1
#     fi

#     if [ -d "$root/.git" ]; then
#         url=`git -C $root config --get remote.origin.url`
#         ansible-pull -U https://github.com/simondubois/project-installer.git \
#             -e "git_repository=$url git_destination=$root" \
#             -d "/tmp/project-installer"
#     else
#         paths=($(list $root))
#         for path in "${paths[@]}"
#         do :
#             run $path
#         done
#     fi
# }
