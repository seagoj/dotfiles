source::all() {
    if [ -d "${1}" ]; then
        for file in "${1}"/*; do
            echo "${file}"
            source "${file}"
        done
    fi
}

source::file() {
    if [ -s "${1}" ]; then
        source "${1}"
    fi
}
