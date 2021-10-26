# vim: filetype=sh:

source_all() {
    if [ -d "${1}" ]; then
        for file in "${1}"/*; do
            source "${file}"
        done
    fi
}

source_file() {
    if [ -s "${1}" ]; then
        source "${1}"
    fi
}