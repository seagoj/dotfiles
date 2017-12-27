#!/bin/bash

lynx() {
    run-dockerized \
        --repo jess/lynx \
        --container lynx \
        --arguments "${@}"
}
