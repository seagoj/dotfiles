function! AutoInstallVimPlug()
    let vimPlugInstalled=1
    let vimPlugFile=expand("$XDG_CONFIG_HOME/nvim/autoload/plug.vim")
    if !filereadable(vimPlugFile)
    echo "Installing vim-plug..."
    !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vimPlugInstalled=0
    endif
    return vimPlugInstalled
endfunction

let vimPlugInstalled=AutoInstallVimPlug()
let s:uname = system("echo -n \"$(uname)\"")

call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
" Essential
Plug 'airblade/vim-gitgutter'
if !v:shell_error && s:uname == "Linux"
    Plug 'KabbAmine/zeavim.vim'
elseif !v:shell_error && s:uname == "Darwin"
    Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim' | Plug 'seagoj/dash-config.vim'
endif
Plug 'sjl/gundo.vim' | Plug 'seagoj/gundo-config.vim'
Plug 'rking/ag.vim' | Plug 'seagoj/ag-config.vim'
" Plug 'scrooloose/syntastic' | Plug 'seagoj/syntastic-config.vim'
Plug 'w0rp/ale' | Plug 'maximbaz/lightline-ale' | Plug 'seagoj/ale-config'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips' | Plug 'seagoj/ultisnips-config.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' | Plug 'seagoj/fugitive-config.vim'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': 'installYCM'}
Plug 'yggdroot/indentline' | Plug 'seagoj/indentline-config.vim'
Plug 'seagoj/autosource-vimrc.vim', {'for': 'vim'}
Plug 'seagoj/buffers.vim'
Plug 'seagoj/disable-cursor-keys.vim'
Plug 'seagoj/git-gutter-feature.vim'
Plug 'seagoj/last-position.vim'
Plug 'seagoj/line-wrap-navigation.vim'
Plug 'seagoj/overlength.vim'
Plug 'seagoj/tab-management.vim'
Plug 'christoomey/vim-tmux-navigator' | Plug 'seagoj/vim-tmux-navigator-config'
Plug 'xero/sourcerer.vim' | Plug 'seagoj/sourcerer-config.vim'
Plug 'vim-vdebug/vdebug' | Plug 'seagoj/vdebug-config'
Plug 'ryanoasis/vim-devicons'
Plug 'seagoj/netrw-config.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-projectionist'
Plug 'sheerun/vim-polyglot' | Plug 'seagoj/vim-polyglot-config'
Plug 'seagoj/lightline.vim' | Plug 'seagoj/lightline-config.vim'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' | Plug 'seagoj/gist-vim-config'
Plug 'janko-m/vim-test' | Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim' | Plug 'seagoj/vim-test-config'
Plug 'seagoj/rainbow' | Plug 'seagoj/rainbow-config.vim'
Plug 'luochen1990/rainbow' | Plug 'seagoj/rainbow-config.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'gabeharms/tslime.vim'

" Language Specific
Plug 'seagoj/c.vim', {'for': 'c'}
Plug 'seagoj/php.vim', {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}
Plug 'seagoj/rust-config.vim', {'for': 'rust'}
Plug 'noahfrederick/vim-composer', {'for': 'markdown'} | Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'
function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release
        else
            !cargo build --release --no-default-features --features json-rpc
        endif
    endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'hsanson/vim-android'

" Experimental
" Plug 'vim-scripts/SyntaxAttr.vim'
" Plug 'tpope/vim-db'
Plug 'vim-scripts/auto-pairs-gentle'

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
" Plug 'adoy/vim-php-refactoring-toolbox'
" Plug 'google/vim-coverage' | Plug 'google/vim-maktaba' | Plug 'google/vim-glaive' | Plug 'seagoj/vim-coverage-config.vim'
Plug 'arnaud-lb/vim-php-namespace' | Plug 'seagoj/vim-php-namespace-config.vim'
Plug 'tobyS/vmustache' | Plug 'YaroslavMolchan/pdv' | Plug 'seagoj/pdv-config.vim'
" Plug 'soywod/vim-keepeye'
" let g:keepeye_autostart = 1
" let g:keepeye_timer = 60 * 50
call plug#end()

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0

if vimPlugInstalled == 0
    :PlugInstall
endif
