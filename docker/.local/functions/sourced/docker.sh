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
    ARGUMENTS=""
    DOCKER_ARGUMENTS=""
    while [[ $# -gt 0 ]]; do
        case "$1" in
        "--repo")
            HUB_REPO=$2
            shift 2
            ;;
        "--container")
            CONTAINER=$2
            shift 2
            ;;
        "--arguments")
            if [[ $# -eq 1 ]]; then
                shift
            else
                ARGUMENTS=$2
                shift 2
            fi
            ;;
        "-e")
            DOCKER_ARGUMENTS+="${1} ${2} "
            shift 2
            ;;
        "-v")
            DOCKER_ARGUMENTS+="${1} ${2} "
            shift 2
            ;;
        *)
            echo "unknown parameter: $1"
            usage "${0}"
            return
            ;;
        esac
    done

    if [ -z "$HUB_REPO"  ] || [ -z "$CONTAINER" ]; then
        usage "${0}"
        return
    fi

    # echo "docker exec -it ${HUB_REPO} ${CONTAINER} ${ARGUMENTS}"
    # echo "docker run -it ${DOCKER_ARGUMENTS} ${HUB_REPO} ${CONTAINER} ${ARGUMENTS}"
    eval "docker exec -it ${HUB_REPO} ${CONTAINER} ${ARGUMENTS} 2>/dev/null" || \
        eval "docker run -it ${DOCKER_ARGUMENTS} ${HUB_REPO} ${CONTAINER} ${ARGUMENTS} 2>/dev/null"
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
