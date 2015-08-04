#!/bin/sh

function split {
    if [[ "$1" == "v" ]]; then
        tmux split-window -v
    elif [[ "$1" == "h" ]]; then
        tmux split-window -h
    else
        tmux new-window -t $PROJECT
    fi
}
