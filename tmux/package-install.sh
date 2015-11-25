#!/bin/zsh

function installTmuxMac()
{
    bootstrap brew

    brew install https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb
}

function installTmuxLinux()
{
    apt-get install -y tmux
}

function installTmuxArch()
{
    autoload archInstall; archInstall tmux
}

if ! which tmux >/dev/null; then
    case $OS_TYPE in
    Darwin)
        installTmuxMac
        ;;
    Linux)
        installTmuxLinux
        ;;
    Arch)
        installTmuxArch
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
