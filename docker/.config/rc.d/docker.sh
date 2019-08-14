#!/usr/bin/env bash

unalias docker 2>/dev/null;

if [[ ! -d "${HOME}"/.local/shared ]]; then
    mkdir -p "${HOME}"/shared
fi

if [[ ! -f "${HOME}"/.local/share/timezone ]]; then
    echo "America/Chicago" > "${HOME}"/.local/share/timezone
fi

function docker() {
    # if ! command docker; then
    #     osinstall docker
    # fi

    case "$1" in
    "destroy")
        command docker stop $(docker ps -a -q); \
            docker rm $(docker ps -a -q); \
            docker rmi $(docker images -q)
        ;;
    "up")
        image=${2:-"bonfyre:dotfiles"}
        command docker build -t "${image}" .
        ;;
    *)
        command docker "$@"
        ;;
    esac
}
