xColor() {
    xrdb -query | grep "\*\.${1}:" | sed "s#\*\.${1}:\s##"
}
