#!/bin/bash

function installRangerMac()
{
    bootstrap brew

    brew install w3m lynx highlight atool mediainfo xpdf libcaca --with-imlib2
}

if ! which ranger >/dev/null; then
    case $(uname -s) in
    "Darwin")
        installRangerMac
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
