function! plugin#init() abort
    if &compatible
        set nocompatible
    endif

    if &loadplugins
        if has('packages')
            " GENERAL
            " - themes
            packadd! sourcerer.vim | packadd! sourcerer-config.vim
            " undo
            packadd! gundo.vim | packadd! gundo-config.vim
            " search/file fuzzyfinding
            packadd fzf | packadd! fzf.vim | packadd! rg.vim | packadd! fzf-config.vim
            " - visual find and replace
            packadd! vim-multiple-cursors
            " Disable arrow keys
            packadd! disable-cursor-keys.vim
            " Open to last postiion in the file
            packadd! last-position.vim
            " Navigate wrapped lines with hjkl
            packadd! line-wrap-navigation.vim
            " Navigate tabs
            packadd! tab-management.vim
            " Netrw config
            packadd! netrw-config.vim
            " Statsubar
            packadd! lightline.vim | packadd! lightline-config.vim | packadd! vim-devicons
            " Buffer navigation
            packadd! buffers.vim
            packadd! vim-tmux-navigator | packadd! vim-tmux-navigator-config
            " Find/Replace
            packadd! greplace.vim
            " note taking
            packadd! vimwiki
            " file picker
            packadd! vifm.vim

            " DEVELOPMENT
            " - comments
            packadd! vim-commentary
            " - project
            packadd! vim-projectionist
            " - - formatting
            packadd! editorconfig-vim
            " Handle paired characters
            packadd! vim-surround
            packadd! auto-pairs-gentle
            " " packadd! seagoj/rainbow') | packadd! seagoj/rainbow-config.vim
            " " packadd! luochen1990/rainbow') | packadd! seagoj/rainbow-config.vim
            " - git
            packadd! vim-gitgutter
            packadd! vim-fugitive | packadd! fugitive-config.vim
            packadd! git-gutter-feature.vim
            " packadd! mattn/gist-vim') | packadd! mattn/webapi-vim') | packadd! seagoj/gist-vim-config')
            " Documentation browser
            let s:uname = system("echo -n \"$(uname)\"")
            if !v:shell_error && s:uname == "Linux"
                let g:zv_zeal_executable="/usr/bin/zeal"
                packadd! zeavim.vim
            elseif !v:shell_error && s:uname == "Darwin"
                packadd! rizzatti/funcoo.vim | packadd! rizzatti/dash.vim | packadd! seagoj/dash-config.vim
            endif
            " Syntax linter/autocompletion
            " packadd! scrooloose/syntastic') | packadd! seagoj/syntastic-config.vim')
            packadd! ale | packadd! lightline-ale | packadd! ale-config
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
            " Overlength highlighter
            packadd! overlength.vim
            " Debugger
            packadd! vdebug | packadd! vdebug-config

            " Language Specific
            call plugin#c()
            call plugin#javascript()
            " call plugin#markdown()
            call plugin#php()
        endif
    endif

    " TODO: rewrite these commands for the submodule package scheme
    " command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
    " command! PackInstall PackUpdate
    " command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
    " command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

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
    " " Auto generate `use` statements
    " packadd! vim-php-namespace | packadd! vim-php-namespace-config.vim
    " documentor
    packadd! vmustache | packadd! pdv | packadd! pdv-config.vim
    " refactor
    packadd! vim-php-refactoring-toolbox
endfunction
