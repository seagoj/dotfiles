if ! which mpd > /dev/null; then
    osinstall mpd
fi

if ! which ncmpcpp > /dev/null; then
    osinstall ncmpcpp --with-fftw mpc
fi

function installArch() {
    if ! which GMusicProxy > /dev/null; then
        osinstall gmusicproxy-git
    fi
}

function installMac() {
    if ! which GMusicProxy > /dev/null; then
        osinstall python3 --with-brewed-openssl
        git clone https://github.com/diraimondo/gmusicproxy.git $CODE/gmusicproxy &&\
            cd $CODE/gmusicproxy &&\
            sudo pip3 install -r requirements.txt
    fi
}

if ! which gmusic-mpd > /dev/null; then
    sudo npm -g install gmusic-mpd
fi

autoload dotfilesInstall; dotfilesInstall ncmpcpp
