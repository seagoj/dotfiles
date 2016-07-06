installMac() {
    osinstall https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb reattach-to-user-namespace
}

installArch() {
    osinstall tmux
}

dotfiles::install tmux
