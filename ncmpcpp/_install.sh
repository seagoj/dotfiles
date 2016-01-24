if ! which mpd > /dev/null; then
    osinstall mpd
fi

if ! which ncmpcpp > /dev/null; then
    osinstall ncmpcpp
fi

if ! which GMusicProxy > /dev/null; then
    osinstall gmusicproxy-git
fi

if ! which gmusic-mpd > /dev/null; then
    sudo npm -g install gmusic-mpd
fi
