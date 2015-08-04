#!/bin/bash

tmux split-window -h
# tmux resize-pane -L 20
tmux send-keys "mpd; ncmpcpp" C-m
