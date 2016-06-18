installFonts() {
    dotfiles::update_repo git://github.com/powerline/fonts.git fonts | grep "up to date" >/dev/null

    if [[ $? -ne 0 ]]; then
        ./install.sh
        popd >/dev/null
    fi
}

installArch() {
    installFonts
}

installMac() {
    installFonts
}

dotfiles::install general
