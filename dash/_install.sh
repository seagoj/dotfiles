installMac() {
    if [[ ! -f ~/bin/Dash ]]; then
        ln -s /Applications/Dash.app/Contents/MacOS/Dash ~/bin/Dash
    fi
}

# dotfiles::install dash
