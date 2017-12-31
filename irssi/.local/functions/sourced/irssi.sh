#!/bin/bash

unalias irssi 2>/dev/null

irssi() {
    docker run -it \
        -v /etc/localtime:/etc/localtime \
        -v "${HOME}"/.irssi:/home/user/.irssi \
        --name irssi \
        jess/irssi \
        "${@}" 2>/dev/null

    if [[ $? -ne 0 ]]; then
        docker start -a -i irssi "${@}"
    fi
}
