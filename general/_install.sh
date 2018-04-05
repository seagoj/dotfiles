installFonts() {
    dotfiles::update_repo git://github.com/ryanoasis/nerd-fonts nerd-fonts | \
        grep "up to date" >/dev/null

    if [[ $? != 0 ]]; then
        ./install.sh "SourceCodePro" && \
        ./install.sh "Terminus" && \
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
