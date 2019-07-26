function! ycm#build(hooktype, name) abort
    !cd $XDG_CONFIG_HOME/nvim/pack/minpac/start/YouCompleteMe && ./install.py --clang-completer
endfunction
