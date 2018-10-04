function! composer#build(hooktype, name) abort
    if has('nvim')
        !cargo build --release
    else
        !cargo build --release --no-default-features --features json-rpc
    endif
endfunction
