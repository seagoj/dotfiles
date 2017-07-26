#!/bin/bash

# shellcheck disable=SC1090
. "${XDG_FUNCTIONS_DIR}"/tmux.sh

# project settings
PROJECT="${PWD##*/}"

if [[ -f ~/.tmux/projects/$PROJECT ]]; then
	tmux attach -t "$PROJECT" || source ~/.tmux/projects/"$PROJECT"
else
	tmux attach -t "$PROJECT" || source ~/.tmux/projects/general
fi
