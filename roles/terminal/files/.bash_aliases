
#
# Basic shell
#

alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'

alias rm='trash-put'

alias nano='nano -u -c -w -T 4'
alias n='nautilus'
alias s='subl'



#
# Media handling
#

alias rss-update='ssh dubandubois.com "php-5.6 dubandubois.com/cloud/cron.php"'

alias mp3bitratecheck='find . -name "*.mp3" -exec mp3info -r a -p "\"{}\"\t%r\n" "{}" \; | grep -v "12[0-9]."'
alias mp3bitrateconvert='for f in *.mp3; do avconv -i "$f" -c:a libmp3lame -b:a 128k "${f%.*}2.mp3"; done'

video-encode() { avconv -i "$1" -strict experimental ~/$1.mp4; }
video-rotate() { avconv -i "$1" -vf transpose=1 -strict experimental ~/$1.mp4; }



#
# Development environment
#

alias log='tail -f /var/log/apache2/error.log'
blackfire-php() { (sudo php5dismod xdebug && sudo service php5-fpm restart; blackfire run $@; sudo php5enmod xdebug && sudo service php5-fpm restart); }

alias projects-git='desk run project-installer git-all'
alias projects-status='projects-git "status -sb"'
