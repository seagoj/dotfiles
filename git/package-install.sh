# /bin/bash

function installGit()
{
    if ! which git >/dev/null; then
        case $OS_TYPE in
          Arch)
            source zsh/package-install.sh &&\
            install git &&\
                installZprezto
            ;;
          FreeBSD)
            echo "Please define how to install git in bootstrap.sh"
            ;;
          Darwin | Mac)
              source zsh/packacge-install.sh
            install git &&\
                installZprezto
            ;;
        esac
    fi
}

installGit
