#!/bin/sh

source $FUNCTIONS/split.tmux

function tmuxOsxey {
    split "$1"
    tmux send-keys "OSXey -c && wwwtxt" C-m
}
