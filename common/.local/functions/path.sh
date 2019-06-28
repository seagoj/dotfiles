path::add() {
    while [[ $# -gt 1 ]]; do
        case "$1" in
        -f|--force|-r|--relative)
            local FORCE=YES
            shift
            ;;
        -p|--prepend)
            local PREPEND=YES
            shift
            ;;
        *)
            break
            ;;
        esac
    done

    while [[ $# -gt 0 ]]; do
        if [[ "$FORCE" == "YES" || -d $1 ]] && [[ ":$path:" != ":$1:" ]]; then
            if [[ "$PREPEND" == "YES" ]]; then
                export path=($1 $path)
            else
                export path=($path $1)
            fi
        fi
        shift
    done
}

