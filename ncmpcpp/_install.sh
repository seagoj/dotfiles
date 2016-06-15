if ! which mpd >/dev/null; then
    osinstall mpd
fi

if ! which ncmpcpp >/dev/null; then
    osinstall ncmpcpp --with-fftw mpc
fi

installArch() {
    if ! which GMusicProxy &>/dev/null; then
        osinstall gmusicproxy-git
    fi
}

installMac() {
    if ! which GMusicProxy &>/dev/null; then
        osinstall python3 --with-brewed-openssl
        git clone https://github.com/diraimondo/gmusicproxy.git $CODE/gmusicproxy &&\
            cd $CODE/gmusicproxy &&\
            general::sudo pip3 install -r requirements.txt
    fi
}

if ! which gmusic-mpd &>/dev/null; then
    general::sudo npm -g install gmusic-mpd
fi

dotfiles::install ncmpcpp
