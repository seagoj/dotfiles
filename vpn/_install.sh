if ! which openconnect &>/dev/null; then
    osinstall openconnect networkmanager-openconnect &&\
        sudo systemctl restart NetworkManager.service
fi
