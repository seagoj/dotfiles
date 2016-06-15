installArch() {
    osinstall python-pip
    sudo pip install mycli
}

installMac() {
    osinstall python3
    sudo pip3 install mycli
}

dotfiles::install mycli
