#!/bin/bash
# vim: filetype=sh:

# shellcheck disable=SC1090
source "${XDG_FUNCTIONS_DIR}/log.sh"

cli::strict() {
	set -euo pipefail
	IFS=$'\n\t'
}

cli::trap_exit() {
	trap cleanup EXIT
}

cli::usage() {
	grep '^#/' "$0" | cut -c4-
	USAGE=1
	exit 0
}

# shellcheck disable=SC2034
USAGE=0
cli::strict
cli::trap_exit
