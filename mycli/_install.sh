#!/bin/bash

if ! which mycli > /dev/null; then
    osinstall pip
    pip install mycli
do
