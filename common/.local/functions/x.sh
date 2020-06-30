xColor() {
    echo "$(basename ${0})"
    xrdb -query | awk "/\*\.$1:/{print \$2}"
}
