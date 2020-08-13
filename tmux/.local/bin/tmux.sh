#!/bin/sh

# shellcheck disable=SC1090
. "${XDG_FUNCTIONS_HOME}"/tmux.sh

# project settings
PROJECT="${1:-${PWD##*/}}"

tmux_attachOrCreate
