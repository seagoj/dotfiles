if ! which pomo &>/dev/null; then
    if ! which gem &>/dev/null; then
        osinstall gem
    fi
    gem install pomo
fi

if [[ ! -f "${HOME}"/.pomorc ]]; then
    pomo initconfig
fi
