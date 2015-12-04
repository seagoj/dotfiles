#!/bin/zsh

if ! which tmux >/dev/null; then
    case $OS_TYPE in
    Darwin | Mac)
        install https://raw.githubusercontent.com/choppsv1/homebrew-term24/master/tmux.rb
        ;;
    Linux | Arch)
        install tmux
        ;;
    *)
        DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        echo "Please define ${DIR##*/} installation for $(uname -s)"
        exit 1
        ;;
    esac
fi