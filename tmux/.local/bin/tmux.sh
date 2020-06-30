#!/bin/sh

# shellcheck disable=SC1090
. "${XDG_FUNCTIONS_HOME}"/tmux.sh

# project settings
PROJECT="${1:-${PWD##*/}}"

tmux_createFromProject() {
    project_dir="${PROJECT_DIR:-${HOME}/.tmux/projects}"
    project_default="${PROJECT_DEFAULT:-general}"
    project_file="${project_dir}"/"${project_default}"

    if [ -f "${project_dir}"/"${PROJECT}" ]; then
        project_file="${project_dir}"/"${PROJECT}"
    fi

    source "${project_file}"
}

tmux -u attach -d -t "${PROJECT}" || tmux_createFromProject
