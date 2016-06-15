dotfiles::bootstrap go

if ! which boilr >/dev/null; then
    go get github.com/tmrts/boilr && go install github.com/tmrts/boilr
fi
