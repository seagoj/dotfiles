scriptencoding utf-8
set encoding=utf-8
set guifont=Sauce\ Code\ Powerline\ Semibold:h10
set ffs=unix,mac,dos
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/vundle/

function! AutoInstallVimPlug()
    let vimPlugInstalled=1
    let vimPlugFile=expand('~/.vim/autoload/plug.vim')
    if !filereadable(vimPlugFile)
        echo "Installing vim-plug..."
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let vimPlugInstalled=0
    endif
    return vimPlugInstalled
endfunction

" @todo - figure out how to move to airline-config
function! AirlineConfig()
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
endfunction

let vimPlugInstalled=AutoInstallVimPlug()

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim' | Plug 'seagoj/gundo-config.vim'
Plug 'edsono/vim-matchit'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim' | Plug 'seagoj/gist-config.vim'
Plug 'rking/ag.vim' | Plug 'seagoj/ag-config.vim'
Plug 'scrooloose/syntastic' | Plug 'seagoj/syntastic-config.vim'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab' | Plug 'SirVer/ultisnips' | Plug 'seagoj/ultisnips-config.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' | Plug 'seagoj/fugitive-config.vim'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline' | Plug 'seagoj/indentline-config.vim'
Plug 'seagoj/autosource-vimrc.vim'
Plug 'seagoj/buffer-selection.vim'
Plug 'seagoj/disable-cursor-keys.vim'
Plug 'seagoj/git-gutter-feature.vim'
Plug 'seagoj/last-position.vim'
Plug 'seagoj/line-wrap-navigation.vim'
Plug 'seagoj/overlength.vim'
Plug 'seagoj/tab-management.vim'
Plug 'seagoj/whitespace.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-scripts/localrc.vim'
" Plug 'spf13/PIV' | Plug 'seagoj/piv-config.vim'
Plug 'craigemery/vim-autotag'
" Plug 'chriskempson/tomorrow-theme' | Plug 'seagoj/tomorrow-night-config.vim'
Plug 'altercation/solarized' | Plug 'seagoj/solarized-config.vim'
" Plug 'chase/vim-ansible-yaml'
Plug 'bling/vim-airline'
"| Plug 'seagoj/airline-config.vim'
call plug#end()

filetype plugin on
filetype indent on

if vimPlugInstalled == 0
    :PlugInstall
endif

set mouse=a                     "Enable mouse use
set scrolloff=5                 "When possible, show 5 lines above and below the cursor
set wildmenu                    "Autocomplete and fun stuff
set number                      "Show line numbers
set cmdheight=2                 "shortens cmd height
set backspace=eol,start,indent  "backspace configuration
set autoread                    "automatically watch for changes
set hidden                      "hides unsaved files instead of forcing you to save/quit
set modelines=5
set laststatus=2
set tags=.git/tags
set nobackup
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Searching
set ignorecase      "ignore case when searching
set smartcase       "If a pattern contains an uppercase, then the search is case sensitive
set hlsearch        "Highlight searches
set incsearch       "More like webbrowser search
" set nolazyredraw    "Don't redraw during macros
set magic           "For regular expressions
set showmatch       "Matching braces highlighting
set matchtime=2     "Blink for 2 tenths of a second when matching
" No Sound On Errors
set visualbell
set timeoutlen=500
" Spaces/Tabs
set expandtab       "Insert spaces whenever <tab> is pressed
set tabstop=4       "Use 4 spaces for a tab
set softtabstop=4   "Softtabstop?
set shiftwidth=4    "Change prior entered tabs to be 4 spaces
set smarttab        "Manage spaces as if they were tabs
set autoindent      "Newline uses indentation depth of the previous
set smartindent     "Newline conditionally uses 1 more indent
" Code Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set cul
set splitright
" Define Invisible Characters
set listchars=tab:¦\ ,extends:»,precedes:«,nbsp:×,eol:¬,trail:·
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" Specify Behavior For Switching Buffers
try
    set switchbuf=useopen,usetab,newtab
    set showtabline=2
catch
endtry
set pastetoggle=<leader>z

call AirlineConfig()

" Mappings
let mapleader   = ","
let g:mapleader = ","
" Copy to clipboard
map         <leader>c       "*y
" Change CWD to directory of selected buffer
map         <leader>cd      :cd %:p:h<cr> :pwd<cr>
" Toggle Invisibles
map         <leader>l       :set list!<cr>
nnoremap    <leader>o       <Esc>:NERDTreeToggle<cr>
map         <leader>p       <Esc><c-p>
nnoremap    <leader>r       :RainbowParenthesesToggle<cr>
nnoremap    <leader>v       :vnew<bar>CtrlP<cr>
nmap        <leader>w       :retab!<cr> :update!<cr>
map         <leader>ev      :tabnew $MYVIMRC<cr>
map         <leader>k       0y$:! open <C-r>"<cr>j<leader>k
nmap        <leader><space> :nohlsearch<cr>
" Moves current line up/down
nnoremap    <leader><Up>    :m-2<cr>
nnoremap    <leader><Down>  :m+1<cr>
" Align paragraph
map         <leader>ap      =ip
" Clone paragraph
map         <leader>cp      yap<S-}>p
imap        jj              <Esc>
imap        kk              <Esc>
vmap        <               <gv
vmap        >               >gv
nnoremap    ;               :
nmap        p               ]p
" Sudo write
cmap        w!!             w !sudo tee % >/dev/null
nnoremap    <F3>            <Esc>:Git push<cr>
nnoremap    <F12>           <Esc>:Dash!<cr>
nnoremap    <F5>            <Esc>:!phpspec run <c-r>=expand('%:p')<cr><cr>
nnoremap <C-j>   <C-W>j
nnoremap <C-k>   <C-W>k
nnoremap <C-h>   <C-W>h
nnoremap <C-l>   <C-W>l

if has("autocmd")
    if ! has("gui_running")
        set guioptions-=T         " Remove toolbar
        set guioptions-=r         " Remove right scrollbar
    endif
endif
