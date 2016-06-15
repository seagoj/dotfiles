installMac() {
    if ! which curl &>/dev/null; then
        dotfiles::bootstrap curl
    fi

    if ! which ruby &>/dev/null; then
        dotfiles::bootstrap ruby
    fi

    if ! which brew &>/dev/null; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

dotfiles::install brew
