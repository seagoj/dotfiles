if ! mac >/dev/null; then
    update_repo https://github.com/guarinogabriel/mac-cli  mac-cli
    sh mac install
fi
