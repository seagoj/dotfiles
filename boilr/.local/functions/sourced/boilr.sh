#!/bin/bash

unalias boilr 2>/dev/null

boilr() {
    docker run -it --rm \
        -v /etc/localtime:/etc/localtime:ro \
        -v "${PWD}":/home/boilr/cwd \
        -v "${HOME}"/.config/boilr:/home/boilr/.config/boilr \
        --name boilr \
        seagoj/docker-boilr \
        "${@}"
}
