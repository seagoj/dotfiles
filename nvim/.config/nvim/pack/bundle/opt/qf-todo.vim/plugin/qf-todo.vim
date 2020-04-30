function! FindTodoInFile()
    :silent! grep 'TODO\|FIXME' %
    if len(getqflist())
        :copen
    else
        :cclose
    endif
endfunction

function FindTodoInProject()
    :silent! grep 'TODO\|FIXME' *
    if len(getqflist())
        :copen
    else
        :cclose
    endif
endfunction

autocmd BufWritePost * :call FindTodoInFile()
" autocmd BufWritePost * :call FindTodoInProject()
