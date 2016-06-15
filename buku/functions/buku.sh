#vim: filetype=bash:

buku::open_from_search() {
    echo |\
        buku -S $* |\
        awk '/\[[0-9]\]/ {print $3}' |\
        sed 's/[^0-9]*//g' |\
        sed 's/^1/buku -o /' |\
        sed 's/0$//g' |\
        tr '\n' '&; ' |\
        bash
}
