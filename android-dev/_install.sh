#!/bin/bash

devenv() {
    if ! which sdk &>/dev/null; then
        curl -s "https://get.sdkman.io" | bash
    fi

    if ! which gradle &>/dev/null; then
        sdk install gradle 4.5.1
    fi
}

devenv
