#!/bin/bash

unalias boilr 2>/dev/null

boilr() {
    docker run -it --rm \
        -e TZ="$(readlink /etc/localtime | cut -d/ -f6-7)" \
        -v "${PWD}":/home/boilr/cwd \
        -v "${HOME}"/.config/boilr:/home/boilr/.config/boilr \
        --name boilr \
        seagoj/docker-boilr \
        "${@}"
}
