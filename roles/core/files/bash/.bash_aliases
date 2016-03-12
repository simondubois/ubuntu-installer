
#
# Basic shell
#

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'

alias grep='grep --color'

alias rm='trash-put'

alias nano='nano -u -c -w -T 4'
alias n='nautilus'
alias s='subl'

alias sysup='sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y'



#
# Media handling
#

unsplashpath='~/Images/wallpapers/unsplash.com'
alias unsplash-download='php ~/www/unsplash-downloader/build/unsplash-downloader --featured --destination '$unsplashpath' --history '$unsplashpath'/history.txt --quantity 100 && n '$unsplashpath
alias unsplash-refresh='cd '$unsplashpath' && sudo python slideshowBuilder.py && cd -'

alias mp3bitratecheck='find ~/Musique/Parodies/ -name "*.mp3" -exec mp3info -r a -p "\"{}\"\t%r\n" "{}" \; | grep -v "12[0-9]."'
alias mp3bitrateconvert='for f in *.mp3; do avconv -i "$f" -c:a libmp3lame -b:a 128k "${f%.*}2.mp3"; done'

video-encode() { avconv -i "$1" -strict experimental ~/$1.mp4; }
video-rotate() { avconv -i "$1" -vf transpose=1 -strict experimental ~/$1.mp4; }



#
# Development environment
#

alias log='tail -f /var/log/apache2/error.log'
blackfire-php() { (sudo php5dismod xdebug && sudo service php5-fpm restart; blackfire run $@; sudo php5enmod xdebug && sudo service php5-fpm restart); }

alias mysql='mysql -uroot'
alias mysqldump='mysqldump -uroot'



#
# Pimenteo projects
#

mysuppath='/var/www/mysup'
alias mysupcd='cd $mysuppath'
alias mysuprestore='mysql -e "DROP DATABASE lea_db; CREATE DATABASE lea_db" && mysql lea_db < $mysuppath/fuel/app/sql/lea_prod.sql && mysql lea_db < $mysuppath/queries.sql'

drawerpath='/var/www/drawer-1611'
alias drawercd='cd $drawerpath'
alias drawerrestore='mysql -e "DROP DATABASE drawer_new_db; CREATE DATABASE drawer_new_db" && mysql drawer_new_db < $drawerpath/migrated_db.sql && mysql drawer_new_db -e "UPDATE ps_shop_url SET domain = \"drawer-new.dev\" WHERE ps_shop_url.id_shop_url = 1"'
