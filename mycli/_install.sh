installArch() {
    osinstall python-pip
    general::sudo pip install mycli
}

installMac() {
    osinstall python3
    general::sudo pip3 install mycli
}

dotfiles::install mycli
