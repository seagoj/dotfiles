function! plugin#vimPlugWasInstalled()
    let vimPlugInstalled=1
    let vimPlugFile=expand("$XDG_CONFIG_HOME/nvim/autoload/plug.vim")
    if !filereadable(vimPlugFile)
        echo "Installing vim-plug..."
        !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let vimPlugInstalled=0
    endif
    return vimPlugInstalled
endfunction

function! plugin#init()
    call plug#begin("$XDG_CONFIG_HOME/nvim/pack/plugged/start")
        " undo
        Plug 'sjl/gundo.vim' | Plug 'seagoj/gundo-config.vim'
        " search
        Plug 'rking/ag.vim' | Plug 'seagoj/ag-config.vim'
        " file fuzzyfinding
        Plug 'kien/ctrlp.vim' | Plug 'seagoj/ctrlp-config.vim'
        " visual find and replace
        Plug 'terryma/vim-multiple-cursors'
        " Disable arrow keys
        Plug 'seagoj/disable-cursor-keys.vim'
        " Handle paired characters
        Plug 'tpope/vim-surround'
        Plug 'vim-scripts/auto-pairs-gentle'
        " Plug 'seagoj/rainbow' | Plug 'seagoj/rainbow-config.vim'
        Plug 'luochen1990/rainbow' | Plug 'seagoj/rainbow-config.vim'
        " Open to last postiion in the file
        Plug 'seagoj/last-position.vim'
        " Navigate wrapped lines with hjkl
        Plug 'seagoj/line-wrap-navigation.vim'
        " Navigate tabs
        Plug 'seagoj/tab-management.vim'
        " Colorscheme
        Plug 'xero/sourcerer.vim' | Plug 'seagoj/sourcerer-config.vim'
        " Netrw config
        Plug 'seagoj/netrw-config.vim'
        " Statsubar
        Plug 'seagoj/lightline.vim' | Plug 'seagoj/lightline-config.vim'
        " Buffer navigation
        Plug 'seagoj/buffers.vim'
        Plug 'christoomey/vim-tmux-navigator' | Plug 'seagoj/vim-tmux-navigator-config'
        " Find/Replace
        Plug 'skwp/greplace.vim'

        call plugin#development()
    call plug#end()

    if plugin#vimPlugWasInstalled() == 0
        :PlugInstall
    endif
    " call neomake#configure#automake('w')
endfunction

function! plugin#development()
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive' | Plug 'seagoj/fugitive-config.vim'
    Plug 'seagoj/git-gutter-feature.vim'
    Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' | Plug 'seagoj/gist-vim-config'
    " Documentation browser
    let s:uname = system("echo -n \"$(uname)\"")
    if !v:shell_error && s:uname == "Linux"
        Plug 'KabbAmine/zeavim.vim'
    elseif !v:shell_error && s:uname == "Darwin"
        Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim' | Plug 'seagoj/dash-config.vim'
    endif
    " Syntax linter/autocompletion
    " Plug 'scrooloose/syntastic' | Plug 'seagoj/syntastic-config.vim'
    Plug 'w0rp/ale' | Plug 'maximbaz/lightline-ale' | Plug 'seagoj/ale-config'
    Plug 'Valloric/YouCompleteMe', {'do': 'installYCM'}
    " Snippet manager
    Plug 'SirVer/ultisnips' | Plug 'seagoj/ultisnips-config.vim'
    " Comments
    Plug 'tpope/vim-commentary'
    " visual indentation
    Plug 'yggdroot/indentline' | Plug 'seagoj/indentline-config.vim'
    " Icon set
    Plug 'ryanoasis/vim-devicons'
    " Project formatting
    Plug 'editorconfig/editorconfig-vim'
    " Project navigation
    Plug 'tpope/vim-projectionist'
    " Syntax highlighting
    Plug 'sheerun/vim-polyglot' | Plug 'seagoj/vim-polyglot-config'
    " Test runner
    Plug 'janko-m/vim-test' | Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim' | Plug 'seagoj/vim-test-config'
    Plug 'christoomey/vim-tmux-runner' | Plug 'gabeharms/tslime.vim'
    " Overlength highlighter
    Plug 'seagoj/overlength.vim'
    " Debugger
    Plug 'vim-vdebug/vdebug', { 'for': ['php'] } | Plug 'seagoj/vdebug-config'

    call plugin#php()
    call plugin#java()

    " Language Specific
    Plug 'seagoj/c.vim', {'for': 'c'}
    Plug 'seagoj/rust-config.vim', {'for': 'rust'}
    Plug 'noahfrederick/vim-composer', {'for': 'markdown'} | Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'
    Plug 'euclio/vim-markdown-composer', { 'for': 'markdown', 'do': function('plugin#buildComposer') }
    Plug 'hsanson/vim-android', { 'for': 'java' }
    Plug 'seagoj/smarty.vim', { 'for': 'smarty' }

    " Experimental
    " Retired
    " Plug 'vim-scripts/matchit.zip'
    " Plug 'maksimr/vim-jsbeautify'
    " Plug 'seagoj/airline-config.vim' | Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    " Plug 'chase/vim-ansible-yaml'
    " Plug 'junegunn/vader.vim'
    " Plug 'seagoj/markdown.vim'
    " Plug 'rust-lang/rust.vim'
    " Plug 'rodjek/vim-puppet'
    " Plug 'itchyny/lightline.vim'
    " Plug 'dahu/bisectly'
    " Plug 'google/vim-coverage' | Plug 'google/vim-maktaba' | Plug 'google/vim-glaive' | Plug 'seagoj/vim-coverage-config.vim'
    " Plug 'soywod/vim-keepeye'
    " let g:keepeye_autostart = 1
    " let g:keepeye_timer = 60 * 50
    " Plug 'vim-scripts/SyntaxAttr.vim'
    " Plug 'tpope/vim-db'
endfunction

function plugin#java()
    " Plug 'neomake/neomake'
    Plug 'artur-shaik/vim-javacomplete2'
endfunction

function! plugin#php()
    Plug 'seagoj/php.vim', {'for': 'php'}
    Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
    Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}

    " Expermimental
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    " Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'} | Plug 'seagoj/vim-php-namespace-config.vim'
    Plug 'tobyS/vmustache', {'for': 'php'} | Plug 'YaroslavMolchan/pdv', {'for': 'php'} | Plug 'seagoj/pdv-config.vim'
endfunction

function! plugin#buildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release
        else
            !cargo build --release --no-default-features --features json-rpc
        endif
    endif
endfunction
