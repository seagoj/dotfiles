#!/bin/sh

source $FUNCTIONS/split.tmux

function tmuxGulp {
    split "$1"
    tmux send-keys "gulp" C-m
}
