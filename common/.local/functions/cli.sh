#!/bin/sh
# vim: filetype=sh:

# shellcheck disable=SC1090
source "${XDG_FUNCTIONS_HOME}/log.sh"

cli_strict() {
    set -euo pipefail
    IFS=$'\n\t'
}

cli_trap_exit() {
    trap cleanup EXIT
}

cli_usage() {
    grep '^#/' "$0" | cut -c4-
    USAGE=1
    exit 0
}

# shellcheck disable=SC2034
USAGE=0
cli_strict
cli_trap_exit
