#!/bin/bash

lynx() {
    docker run -it --rm \
        -e TZ="$(readlink /etc/localtime | cut -d/ -f6-7)" \
        --name lynx \
        jess/lynx \
        "${@}"
}
