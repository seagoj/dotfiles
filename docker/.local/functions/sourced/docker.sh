#!/bin/bash

unalias docker 2>/dev/null;

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
