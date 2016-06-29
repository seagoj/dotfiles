installArch() {
    osinstall mysql python-pip
    general::sudo pip install mycli
}

installMac() {
    osinstall mysql python3
    general::sudo pip3 install mycli
}

dotfiles::install mycli
