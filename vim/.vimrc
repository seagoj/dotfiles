scriptencoding utf-8
set encoding=utf-8
set guifont=Sauce\ Code\ Powerline\ Semibold:h10
set ffs=unix,mac,dos
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/vundle/

function! AutoInstallVundle()
    let vundleInstalled=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        vundleInstalled=0
    endif
    return vundleInstalled
endfunction

let vundleInstalled=AutoInstallVundle()

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'seagoj/gundo-config.vim'
Plugin 'edsono/vim-matchit'
Plugin 'mattn/gist-vim'
Plugin 'seagoj/gist-config.vim'
Plugin 'mattn/webapi-vim'
Plugin 'rking/ag.vim'
Plugin 'seagoj/ag-config.vim'
Plugin 'scrooloose/syntastic'
Plugin 'seagoj/syntastic-config.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'seagoj/ultisnips-config.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'seagoj/fugitive-config.vim'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'yggdroot/indentline'
Plugin 'seagoj/autosource-vimrc.vim'
Plugin 'seagoj/indentline-config.vim'
Plugin 'seagoj/buffer-selection.vim'
Plugin 'seagoj/disable-cursor-keys.vim'
Plugin 'seagoj/git-gutter-feature.vim'
Plugin 'seagoj/line-wrap-navigation.vim'
Plugin 'seagoj/overlength.vim'
Plugin 'seagoj/tab-management.vim'
Plugin 'seagoj/whitespace.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-scripts/localrc.vim'
Plugin 'spf13/PIV'
" Plugin 'seagoj/piv-config.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'chriskempson/tomorrow-theme'
" Plugin 'seagoj/tomorrow-night-config.vim'
Plugin 'altercation/solarized'
Plugin 'seagoj/solarized-config.vim'
Plugin 'seagoj/airline-config.vim'
call vundle#end()
filetype plugin on
filetype indent on

if vundleInstalled == 0
    :PluginInstall
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

" @todo - figure out how to move to airline-config
" let g:airline_powerline_fonts = 1

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
nmap        <leader><space> :nohlsearch<cr>
" Moves currennt line up/down
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
nnoremap    <F12>           <Esc>:Dash!<cr>

if has("autocmd")
    if ! has("gui_running")
        set guioptions-=T         " Remove toolbar
        set guioptions-=r         " Remove right scrollbar
    endif
    " -Return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
