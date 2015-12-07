#!/bin/bash

if ! which ansible > /dev/null; then
    osinstall ansible
fi
