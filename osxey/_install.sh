if ! which OSXey &>/dev/null; then
    dotfiles::updateRepo git://github.com/Gary00/OSXey osxey
    ./install.sh
    popd
fi

if ! which wwwtxt &>/dev/null; then
    osinstall wwwtxt
fi
