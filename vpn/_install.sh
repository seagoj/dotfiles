if ! which openconnect; then
    osinstall openconnect networkmanager-openconnect &&\
        sudo systemctl restart NetworkManager.service
fi
