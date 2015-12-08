#!/bin/bash

if ! which ag > /dev/null; then
    osinstall silver-searcher-git
fi
