if has("autocmd")
    if ! has("gui_running")
        set guioptions-=T         " Remove toolbar
        set guioptions-=L
        set guioptions-=r         " Remove right scrollbar
        set guioptions+=c
    endif
endif
