#!/bin/bash

. $HOME/functions/tmux.sh

# project settings
PROJECT=${PWD##*/}

if [[ -f ~/.tmux/projects/$PROJECT ]]; then
    tmux attach -t $PROJECT || source ~/.tmux/projects/$PROJECT
else
    tmux attach -t $PROJECT || source ~/.tmux/projects/general
fi
