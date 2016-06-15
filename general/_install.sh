installMac() {
    dotfiles::update_repo git://github.com/powerline/fonts.git fonts | grep "up to date" >/dev/null
    if [[ ! $? -eq 0 ]]; then
        ./install.sh
        popd >/dev/null
    fi
}

dotfiles::install general
