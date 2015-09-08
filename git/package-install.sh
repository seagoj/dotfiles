# /bin/bash

function installGit()
{
    if ! which git >/dev/null; then
        case $(uname -s) in
          "Linux")
            echo "Please define how to install git in bootstrap.sh"
            ;;
          "FreeBSD")
            echo "Please define how to install git in bootstrap.sh"
            ;;
          "Darwin")
            brew install git && installZprezto
            ;;
        esac
    fi
}

installGit
