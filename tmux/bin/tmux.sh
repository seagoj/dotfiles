#!/bin/zsh

# project settings
PROJECT=${PWD##*/}

if [[ -f ~/.tmux/projects/$PROJECT ]]; then
    source ~/.tmux/projects/$PROJECT
else
    source ~/.tmux/projects/general
fi
