#!/bin/bash

password() {
    if [[ -z $1 ]]; then
        echo "No parameter passed."
    fi

    pass "${1}" | head -n 1
}
