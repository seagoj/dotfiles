xColor() {
    xrdb -query | awk "/\*\.$1:/{print \$2}"
}
