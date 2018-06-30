installMac() {
    brew tap homebrew/dupes
    brew tap homebrew/versions
    brew tap homebrew/homebrew-php
    brew unlink php56
    brew install php70
}

installArch() {
    osinstall php
}

dotfiles::install php
