#!/bin/bash

# shellcheck disable=SC1090
. "${XDG_FUNCTIONS_DIR}"/tmux.sh

# project settings
PROJECT="${1:-${PWD##*/}}"

if [[ -f ~/.tmux/projects/$PROJECT ]]; then
    tmux -u attach -d -t "$PROJECT" || source ~/.tmux/projects/"$PROJECT"
else
    tmux -u attach -d -t "$PROJECT" || source ~/.tmux/projects/general
fi
