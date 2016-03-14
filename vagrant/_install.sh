#!/bin/bash

if ! which virtualbox > /dev/null; then
    osinstall virtualbox
fi

if ! which vagrant > /dev/null; then
    osinstall vagrant net-tools
fi
