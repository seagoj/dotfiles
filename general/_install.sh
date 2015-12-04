#! /bin/zsh

case $OS_TYPE in
Arch | Mac | Debian)
    autoload updateRepo; updateRepo git://github.com/powerline/fonts.git fonts &&\
        ./install.sh
    popd
    ;;
*)
    DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    echo "Please define ${DIR##*/} installation for $(uname -s)"
    exit 1
    ;;
esac