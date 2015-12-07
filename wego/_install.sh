#!/bin/bash

if ! which go > /dev/null; then
    osinstall go
fi

if ! which wego > /dev/null; then
    go get github.com/schachmat/wego
fi
