#!/usr/bin/env bash

unalias boilr 2>/dev/null

boilr() {
    docker run -it --rm \
        -v `pwd`:`pwd` -w `pwd` \
        -v "${HOME}"/.config/boilr:/home/boilr/.config/boilr \
        --name boilr \
        seagoj/docker-boilr \
        "${@}"
}
