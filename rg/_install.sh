installMac() {
    osinstall rust &&\
        cargo install ripgrep
}

installArch() {
    osinstall rust &&\
        cargo install ripgrep
}

dotfiles::install rg
