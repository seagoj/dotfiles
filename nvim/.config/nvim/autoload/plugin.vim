function! plugin#init() abort
    if &compatible
        set nocompatible
    endif

    if &loadplugins
        if has('packages')
            call plugin#base()
            call plugin#development()

            " Language Specific
            call plugin#c()
            call plugin#javascript()
            call plugin#markdown()
            call plugin#php()
        endif
    endif
endfunction

function plugin#base() abort
    "colorscheme
    packadd! sourcerer.vim | packadd! sourcerer-config.vim
    " open to last postiion in the file
    packadd! last-position.vim
    " statsubar
    packadd! lightline.vim | packadd! lightline-config.vim | packadd! vim-devicons
    " undo
    packadd! undotree | packadd! undotree-config.vim

    call plugin#navigation()
    call plugin#notes()
    call plugin#search()
endfunction

function plugin#navigation() abort
    " Buffers
    packadd! buffers.vim
    packadd! vim-tmux-navigator | packadd! vim-tmux-navigator-config
    " wrapped lines
    packadd! line-wrap-navigation.vim
    " Navigate tabs
    packadd! tab-management.vim
endfunction

function plugin#notes() abort
    " note taking
    packadd! vimwiki
endfunction

function plugin#search() abort
    " Find/Replace
    packadd! greplace.vim
    " search/file fuzzyfinding
    packadd fzf | packadd! fzf.vim | packadd! fzf-config.vim | packadd! rg.vim
endfunction

function plugin#development() abort
    " comments
    packadd! vim-commentary
    " project navigation
    packadd! vim-vinegar
    packadd! netrw-config.vim
    " packadd! vifm.vim | packadd! vifm-config.vim
    packadd! vim-projectionist
    " formatting
    packadd! editorconfig-vim
    " Handle paired characters
    packadd! vim-surround
    packadd! auto-pairs-gentle
    " git
    packadd! vim-fugitive | packadd! fugitive-config.vim
    " Documentation browser
    if executable('zeal')
        packadd! zeavim.vim
    elseif executable('dash')
        packadd! rizzatti/funcoo.vim | packadd! rizzatti/dash.vim | packadd! seagoj/dash-config.vim
    endif
    " Syntax linter/autocompletion
    packadd! ale | packadd! lightline-ale | packadd! ale-config
    packadd! coc.nvim
    " packadd! Valloric/YouCompleteMe', {'do': function('ycm#build')})
    " Snippet manager
    packadd! ultisnips | packadd! ultisnips-config.vim
    " visual indentation
    packadd! indentline | packadd! indentline-config.vim
    " Syntax highlighting
    packadd! vim-polyglot | packadd! vim-polyglot-config
    " Test runner
    packadd! vim-test | packadd! vim-dispatch | packadd! vim-dispatch-neovim | packadd! vim-test-config
    packadd! vim-tmux-runner | packadd! tslime.vim
    " Debugger
    packadd! vdebug | packadd! vdebug-config
    " todo finder
    packadd! qf-todo.vim
endfunction

function plugin#c() abort
    packadd! c.vim
endfunction

function plugin#javascript() abort
    " javascript only plugins here
endfunction

function plugin#markdown() abort
    " packadd! noahfrederick/vim-composer | packadd! tpope/vim-dispatch | packadd! radenling/vim-dispatch-neovim
    " packadd! euclio/vim-markdown-composer', {'type': 'opt', 'do': function('composer#build') })
    " packadd! gabrielelana/vim-markdown
endfunction

function plugin#php() abort
    " psr-2 formatting
    packadd! php.vim
    " enhanced autocompletion
    packadd! phpcomplete.vim
    " fold comments with code
    packadd! phpfolding.vim
    "" PHP-Expermimental
    packadd! phpactor
    " Auto generate `use` statements
    packadd! vim-php-namespace | packadd! vim-php-namespace-config.vim
    " documentor
    packadd! vmustache | packadd! pdv | packadd! pdv-config.vim
    " refactor
    packadd! vim-php-refactoring-toolbox
endfunction
