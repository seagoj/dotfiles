function! plugin#installMinpac() abort
    echo "Installing minpac..."
    !mkdir -p $XDG_CONFIG_HOME/nvim/pack/minpac/opt/minpac
    !git clone https://github.com/k-takata/minpac.git $XDG_CONFIG_HOME/nvim/pack/minpac/opt/minpac
endfunction

function! plugin#init() abort
    if &compatible
        set nocompatible
    endif

    let minpacWasInstalled=1
    let php=0

    silent! packadd minpac
    if !exists('*minpac#init')
        call plugin#installMinpac()
        let minpacWasInstalled=0
        packadd minpac
    endif

    command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
    command! PackInstall PackUpdate
    command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
    command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

    call minpac#init()
    " colorscheme
    call minpac#add('xero/sourcerer.vim') | call minpac#add('seagoj/sourcerer-config.vim')
    " undo
    call minpac#add('sjl/gundo.vim') | call minpac#add('seagoj/gundo-config.vim')
    " search
    call minpac#add('rking/ag.vim') | call minpac#add('seagoj/ag-config.vim')
    " file fuzzyfinding
    call minpac#add('ctrlpvim/ctrlp.vim') | call minpac#add('seagoj/ctrlp-config.vim')
    " visual find and replace
    call minpac#add('terryma/vim-multiple-cursors')
    " Disable arrow keys
    call minpac#add('seagoj/disable-cursor-keys.vim')
    " Handle paired characters
    call minpac#add('tpope/vim-surround')
    call minpac#add('vim-scripts/auto-pairs-gentle')
    " call minpac#add('seagoj/rainbow') | call minpac#add('seagoj/rainbow-config.vim')
    call minpac#add('luochen1990/rainbow') | call minpac#add('seagoj/rainbow-config.vim')
    " Open to last postiion in the file
    call minpac#add('seagoj/last-position.vim')
    " Navigate wrapped lines with hjkl
    call minpac#add('seagoj/line-wrap-navigation.vim')
    " Navigate tabs
    call minpac#add('seagoj/tab-management.vim')
    " Netrw config
    call minpac#add('seagoj/netrw-config.vim')
    " Statsubar
    call minpac#add('seagoj/lightline.vim') | call minpac#add('seagoj/lightline-config.vim')
    " Buffer navigation
    call minpac#add('seagoj/buffers.vim')
    call minpac#add('christoomey/vim-tmux-navigator') | call minpac#add('seagoj/vim-tmux-navigator-config')
    " Find/Replace
    call minpac#add('skwp/greplace.vim') | call minpac#add('seagoj/greplace-config.vim')
    call minpac#add('vimwiki/vimwiki')
    " file picker
    call minpac#add('vifm/vifm.vim')

    " Git
    call minpac#add('airblade/vim-gitgutter')
    call minpac#add('tpope/vim-fugitive') | call minpac#add('seagoj/fugitive-config.vim')
    call minpac#add('seagoj/git-gutter-feature.vim')
    call minpac#add('mattn/gist-vim') | call minpac#add('mattn/webapi-vim') | call minpac#add('seagoj/gist-vim-config')
    " Documentation browser
    let s:uname = system("echo -n \"$(uname)\"")
    if !v:shell_error && s:uname == "Linux"
        let g:zv_zeal_executable="/mnt/c/Users/jseago/scoop/appseal/current/zeal.exe"
        call minpac#add('KabbAmine/zeavim.vim')
    elseif !v:shell_error && s:uname == "Darwin"
        call minpac#add('rizzatti/funcoo.vim') | call minpac#add('rizzatti/dash.vim') | call minpac#add('seagoj/dash-config.vim')
    endif
    " Syntax linter/autocompletion
    " call minpac#add('scrooloose/syntastic') | call minpac#add('seagoj/syntastic-config.vim')
    call minpac#add('w0rp/ale') | call minpac#add('maximbaz/lightline-ale') | call minpac#add('seagoj/ale-config')
    call minpac#add('Valloric/YouCompleteMe', {'do': function('ycm#build')})
    " Snippet manager
    call minpac#add('SirVer/ultisnips') | call minpac#add('seagoj/ultisnips-config.vim')
    " Comments
    call minpac#add('tpope/vim-commentary')
    " visual indentation
    call minpac#add('yggdroot/indentline') | call minpac#add('seagoj/indentline-config.vim')
    " Icon set
    call minpac#add('ryanoasis/vim-devicons')
    " Project formatting
    call minpac#add('editorconfig/editorconfig-vim')
    " Project navigation
    call minpac#add('tpope/vim-projectionist')
    " Syntax highlighting
    call minpac#add('sheerun/vim-polyglot') | call minpac#add('seagoj/vim-polyglot-config')
    " Test runner
    call minpac#add('janko-m/vim-test') | call minpac#add('tpope/vim-dispatch') | call minpac#add('radenling/vim-dispatch-neovim') | call minpac#add('seagoj/vim-test-config')
    call minpac#add('christoomey/vim-tmux-runner') | call minpac#add('gabeharms/tslime.vim')
    " Overlength highlighter
    call minpac#add('seagoj/overlength.vim')
    " Debugger
    call minpac#add('vim-vdebug/vdebug', { 'type': 'opt' }) | call minpac#add('seagoj/vdebug-config')

    " Language Specific

    "" C
    call minpac#add('seagoj/c.vim', {'type': 'opt'})

    "" Java
    call minpac#add('hsanson/vim-android', {'type': 'opt'})
    call minpac#add('artur-shaik/vim-javacomplete2', {'type': 'opt'})

    "" JavaScript

    "" Markdown
    " call minpac#add('noahfrederick/vim-composer', {'type': 'opt'}) | call minpac#add('tpope/vim-dispatch', {'type': 'opt'}) | call minpac#add('radenling/vim-dispatch-neovim', {'type': 'opt'})
    " call minpac#add('euclio/vim-markdown-composer', {'type': 'opt', 'do': function('composer#build') })
    " call minpac#add('gabrielelana/vim-markdown', {'type': 'opt'})

    if php
        "" PHP
        call minpac#add('seagoj/php.vim', {'type': 'opt'})
        call minpac#add('shawncplus/phpcomplete.vim', {'type': 'opt'})
        call minpac#add('rayburgemeestre/phpfolding.vim', {'type': 'opt'})
        "" PHP-Expermimental
        call minpac#add('phpactor/phpactor', {'do': '!composer install', 'type': 'opt'})
        " call minpac#add('adoy/vim-php-refactoring-toolbox', {'type': 'opt'})
        call minpac#add('arnaud-lb/vim-php-namespace', {'type': 'opt'}) | call minpac#add('seagoj/vim-php-namespace-config.vim', {'type': 'opt'})
        call minpac#add('tobyS/vmustache', {'type': 'opt'}) | call minpac#add('YaroslavMolchan/pdv', {'type': 'opt'}) | call minpac#add('seagoj/pdv-config.vim', {'type': 'opt'})
    endif

    "" Rust
    call minpac#add('seagoj/rust-config.vim', {'type': 'opt'})

    "" Smarty
    call minpac#add('seagoj/smarty.vim', { 'type': 'opt' })

    " Typescript
    call minpac#add('Quramy/tsuquyomi', { 'type': 'opt' })

    " Experimental
    " Retired
    " call minpac#add('vim-scripts/matchit.zip')
    " call minpac#add('maksimr/vim-jsbeautify')
    " call minpac#add('seagoj/airline-config.vim') | call minpac#add('vim-airline/vim-airline') | call minpac#add('vim-airline/vim-airline-themes')
    " call minpac#add('chase/vim-ansible-yaml')
    " call minpac#add('junegunn/vader.vim')
    " call minpac#add('seagoj/markdown.vim')
    " call minpac#add('rust-lang/rust.vim')
    " call minpac#add('rodjek/vim-puppet')
    " call minpac#add('itchyny/lightline.vim')
    " call minpac#add('dahu/bisectly')
    " call minpac#add('google/vim-coverage') | call minpac#add('google/vim-maktaba') | call minpac#add('google/vim-glaive') | call minpac#add('seagoj/vim-coverage-config.vim')
    " call minpac#add('soywod/vim-keepeye')
    " let g:keepeye_autostart = 1
    " let g:keepeye_timer = 60 * 50
    " call minpac#add('vim-scripts/SyntaxAttr.vim')
    " call minpac#add('tpope/vim-db')

    if minpacWasInstalled == 0
        call minpac#update()
    endif
endfunction
