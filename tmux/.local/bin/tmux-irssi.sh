#!/bin/sh

PROJECT=irc

source $FUNCTIONS/irssi.tmux

# Create bot session
tmux -2 new-session -d -s $PROJECT -n 'IRC'

tmuxIrssi

# Attach to session
tmux -2 attach-session -t $PROJECT
