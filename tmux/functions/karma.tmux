#!/bin/sh

source $FUNCTIONS/split.tmux

function tmuxKarma {
    split "$1"
    tmux send-keys "karma start" C-m
}
