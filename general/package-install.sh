#! /bin/bash

function installFonts()
{
    updateRepo git://github.com/powerline/fonts.git fonts &&\
        ./install.sh
    popd
}

case $OS_TYPE in
"Arch")
    installFonts
    ;;
*)
    DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    echo "Please define ${DIR##*/} installation for $(uname -s)"
    exit 1
    ;;
esac
