# /bin/bash

function installBrew()
{
    if ! which curl >/dev/null; then
        echo "Define how to install curl in brew"
        exit 1
    fi

    if ! which ruby >/dev/null; then
        echo "Define how to install ruby in brew"
        exit 1
    fi

    if ! which brew >/dev/null; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

installBrew
