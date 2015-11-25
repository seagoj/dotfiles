# /bin/bash

function installGit()
{
    if ! which git >/dev/null; then
        case $OS_TYPE in
          "Arch")
            sudo pacman -Syu git --noconfirm &&\
                installZprezto
            ;;
          "FreeBSD")
            echo "Please define how to install git in bootstrap.sh"
            ;;
          "Darwin")
            brew install git &&\
                installZprezto
            ;;
        esac
    fi
}

installGit
