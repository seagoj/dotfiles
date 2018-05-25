#!/bin/bash

unalias rainbowstream 2>/dev/null;

rainbowstream() {
    docker run -it \
        -e TZ="$(readlink /etc/localtime | cut -d/ -f6-7)" \
        -v "${HOME}"/.rainbow_oauth:/root/.rainbow_oauth \
        -v "${HOME}"/.rainbow_config.json:/root/.rainbow_config.json \
        --name rainbowstream \
        jess/rainbowstream \
        "${@}" 2>/dev/null

    if [[ $? -ne 0 ]]; then
        docker start -a -i rainbowstream "${@}"
    fi
}
