# /bin/bash

function installGit()
{
    if ! which git >/dev/null; then
        case $OS_TYPE in
          Arch)
            install git &&\
                installZprezto
            ;;
          FreeBSD)
            echo "Please define how to install git in bootstrap.sh"
            ;;
          Darwin | Mac)
            install git &&\
                installZprezto
            ;;
        esac
    fi
}

installGit
