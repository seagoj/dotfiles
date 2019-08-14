#!/bin/bash

unalias curl 2>/dev/null;

function curl::is_json() {
	read -r response
	local formatted
	formatted=$(echo "$response" | json_pp 2>/dev/null)
	if [[ -z "${formatted}" ]]; then
		echo "$response"
		return 1
	fi
	echo "$formatted"
}

function curl() {
	if ! which curl >/dev/null; then
		osinstall curl
	fi

	if ! which json_pp >/dev/null; then
		osinstall json_pp
	fi

	if ! which pygmentize >/dev/null; then
		osinstall pygmentize
	fi

	command curl "$@" | curl::is_json | pygmentize -l json
}
