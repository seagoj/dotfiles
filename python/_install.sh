if ! which python &>/dev/null; then
    case $OS_TYPE in
    Arch)
        osinstall python python2 &&\
            sudo easy_install pip
        ;;
    Darwin | Mac)
        osinstall python &&\
            sudo easy_install pip
        ;;
    Debian)
        osinstall python &&\
            sudo easy_install pip
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi
