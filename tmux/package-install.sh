#!/bin/bash

function installTmuxMac()
{
    bootstrap brew

    brew install https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb
}

function installTmuxLinux()
{
    apt-get install -y tmux
}

if ! which tmux >/dev/null; then
    case $(uname -s) in
    Darwin)
        installTmuxMac
        ;;
    Linux)
        installTmuxLinux
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
