#!/bin/bash

function replace() {
	if [[ $# -ne 2 ]]; then
		echo "usage: replace [search] [replace]"
		exit 1;
	fi

	ag -0 -l "${1}" | xargs -0 sed -ri.bak -e "s/$1/$2/g"
}
