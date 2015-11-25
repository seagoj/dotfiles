#!/bin/zsh

function installRangerMac()
{
    bootstrap brew

    brew install w3m lynx highlight atool mediainfo xpdf libcaca --with-imlib2
}

function installRangerLinux()
{
    apt-get install -y ranger
}

function installRangerArch()
{
    autoload archInstall; archInstall ranger
}

if ! which ranger >/dev/null; then
    case $OS_TYPE in
    "Darwin")
        installRangerMac
        ;;
    "Debian")
        installRangerLinux
        ;;
    "Arch")
        installRangerArch
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
