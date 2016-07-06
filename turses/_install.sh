installMac() {
    dotfiles::bootstrap python

    general::sudo 'pip install turses'
}

installArch() {
    dotfiles::bootstrap python

    general::sudo 'pip install turses'
}

dotfiles::install turses
