" packadd vim-composer | packadd vim-dispatch | packadd vim-dispatch-neovim
" packadd vim-markdown-composer
" let g:markdown_composer_browser="/home/jseago/.local/bin/firefox"
" echo g:markdown_composer_browser
" packadd vim-markdown

if executable('markdown')
    " render markdown
    nmap        <leader>m       :!markdown % > %.html<CR>:vsplit %.html<CR>
endif
