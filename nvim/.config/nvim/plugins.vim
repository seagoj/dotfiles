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

call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
source $XDG_CONFIG_HOME/nvim/plugins/common.vim
source $XDG_CONFIG_HOME/nvim/plugins/development.vim

" Essential
" Language Specific
Plug 'seagoj/c.vim', {'for': 'c'}
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
Plug 'seagoj/smarty.vim'

" Experimental
" Plug 'vim-scripts/SyntaxAttr.vim'
" Plug 'tpope/vim-db'

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
call plug#end()

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

if vimPlugInstalled == 0
    :PlugInstall
endif
