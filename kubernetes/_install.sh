#!/bin/sh

if [[ ! -d kubernetes/.local/bin ]]; then
    mkdir -p kubernetes/.local/bin
fi

if ! which kubectl &>/dev/null; then
    curl -O https://storage.googleapis.com/kubernetes-release/release/v1.8.4/bin/darwin/amd64/kubectl &&
        mv kubectl kubernetes/.local/bin/ &&
        chmod +x kubernetes/.local/bin/kubectl &&
        restow kubernetes
fi
