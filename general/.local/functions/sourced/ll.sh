unalias ll lr lt 2>/dev/null;

function lt() {
    ll -t "${@}"
}

function lr() {
    ll -r "${@}"
}

function ll() {
    ls -al -G "${@}"
}
