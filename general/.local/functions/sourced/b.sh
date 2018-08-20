b() {
    "${BROWSER}" "${@}"
}

bm() {
    echo "q" | buku -S "${@}" --oa &>/dev/null
}
