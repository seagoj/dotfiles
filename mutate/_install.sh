#!/bin/bash

if ! which mutate > /dev/null; then
    osinstall mutate-git
fi
