#!/bin/bash

unalias docker 2>/dev/null;
unalias run-dockerized 2>/dev/null;

function usage() {
    cat <<USAGE

Usage: ${1} REPO CONTAINER [OPTIONS...]

    Runs commands in a docker container
USAGE
}

function run-dockerized() {
    if [[ $# -lt 2 ]]; then
        usage "${0}"
        return
    fi

    HUB_REPO=$1
    CONTAINER=$2
    shift
    shift

    docker exec -it "${HUB_REPO}" "${CONTAINER}" ${@} 2>/dev/null || \
        docker run -it "${HUB_REPO}" "${CONTAINER}" ${@} 2>/dev/null
}

function docker() {
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
