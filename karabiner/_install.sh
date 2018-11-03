# installMac() {
    git clone --depth 1 https://github.com/tekezo/Karabiner-Elements.git "${CODE}/karabiner-elements" && \
        cd "${CODE}/karabiner-elements" && \
        xcode-select --install 2>/dev/null || \
        make
# }

# dotfiles::install karabiner
