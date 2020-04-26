function! ycm#build(hooktype, name) abort
    !cd $XDG_CONFIG_HOME/nvim/pack/bundle/opt/YouCompleteMe && ./install.py --clang-completer
endfunction
