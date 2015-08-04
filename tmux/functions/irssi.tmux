#!/bin/sh

source $FUNCTIONS/split.tmux

function tmuxIrssi {
    split "$1"
    tmux send-keys 'irssi' C-m
}
