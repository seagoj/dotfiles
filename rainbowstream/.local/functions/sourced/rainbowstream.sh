#!/bin/bash

unalias rainbowstream 2>/dev/null;

rainbowstream() {
    docker run -it \
        -v /etc/localtime:/etc/localtime \
        -v "${HOME}"/.rainbow_oauth:/root/.rainbow_oauth \
        -v "${HOME}"/.rainbow_config.json:/root/.rainbow_config.json \
        --name rainbowstream \
        jess/rainbowstream \
        "${@}" 2>/dev/null

    if [[ $? -ne 0 ]]; then
        docker start -a -i rainbowstream "${@}"
    fi
}
