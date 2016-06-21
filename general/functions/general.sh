general::error_exit() {
    echo ""
    echo "${PROGNAME}: ${1:- 'Unknown Error'}" 1>&2
    exit 1
}

general::fail() {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1 exit:$2\n"
    echo ''
    exit $2
}

general::info() {
    printf "  [ \033[00;34m..\033[0m ] $1"
}

general::success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

general::user() {
    printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

general::env_var_to_script() {
    env_var=$1
    shift

    if [[ -z "${env_var}" ]]; then
        echo "No default ${env_var} set"
        exit
    fi

    eval "\$${env_var} $@"
}

general::sudo() {
    if which pass >/dev/null; then
        password=$(pass thinkpad/login | head -n 1)
        eval "sudo -kS <<< $password $@"
    else
        sudo $@
    fi
}

general::set_permission() {
    if [[ $# -ne 2 ]]; then
        echo "usage:"
        echo "setPermission [path to file] [permission]"
        exit 1
    fi

    if [[ -e ${1} ]]; then
        general::sudo chmod ${2} ${1}
        # if which pass >/dev/null; then
        #     echo $(pass thinkpad/login | head -n 1) | sudo chmod ${2} ${1}
        # else
        #     sudo chmod ${2} ${1}
        # fi
    fi
}
