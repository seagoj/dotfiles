if ! which openconnect &>/dev/null; then
    osinstall openconnect networkmanager-openconnect &&\
        general::sudo systemctl restart NetworkManager.service
fi
