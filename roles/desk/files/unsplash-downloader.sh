# tf.sh
#
# Description: CLI to download photos from unsplash.com
#

PRJ_NAME=unsplash-downloader
PRJ_PATH="$HOME/www/$PRJ_NAME"

source ~/.desk/desks/default.sh $PRJ_NAME $PRJ_PATH

PATH=$(npm bin):$PATH
PATH=$(composer config bin-dir --absolute):$PATH

# Build phar file
build() {
    php $PRJ_PATH/create-phar.php
}

# Run unit tests
dev-browse() {
    xdg-open $PRJ_PATH/tests/coverage/index.html > /dev/null
}

# Download photos to Pictures
prod-download() {
    path=~/Pictures/wallpapers/unsplash.com
    php $PRJ_PATH/build/$PRJ_NAME --featured --destination $path --history $path/history.txt --quantity 100
    nautilus $path
}

# Refresh slideshow in Pictures
prod-refresh() {
    cd ~/Pictures/wallpapers/unsplash.com
    sudo python slideshowBuilder.py
    cd -
}
