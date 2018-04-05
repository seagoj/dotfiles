scriptencoding utf-8
set encoding=utf-8
set guifont=SauceCodePro\ Nerd\ Font\ Semibold:h8
set ffs=unix,mac,dos
set nocompatible
set clipboard=unnamed
filetype off

let g:python_host_prog = '/usr/bin/python2'
let g:python2_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

source $XDG_CONFIG_HOME/nvim/plugins.vim
source $XDG_CONFIG_HOME/nvim/keymap.vim
source $XDG_CONFIG_HOME/nvim/macros.vim

filetype plugin on
filetype indent on
set mouse=a                     "Enable mouse use
set scrolloff=5                 "When possible, show 5 lines above and below the cursor
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
" set lazyredraw      "Don't redraw during macros
set magic           "For regular expressions
set showmatch       "Matching braces highlighting
set matchtime=2     "Blink for 2 tenths of a second when matching
" No Sound On Errors
set visualbell
set timeoutlen=500
" Indentation
set autoindent      "Newline uses indentation depth of the previous
set smartindent     "Newline conditionally uses 1 more indent
" Status bar
set showcmd         " Show last command in bottom right
" Code Folding
set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevel=1
set foldlevelstart=1
set cul
set splitright
set splitbelow
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
set relativenumber
set exrc
set secure
" set ts=4
" set sts=4
" set sw=4
" set expandtab
set termguicolors
set noshowmode

function! Strip_trailing_whitespace(...)
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfunction

if has("autocmd")
    autocmd BufWritePre * :retab!
    autocmd BufWritePre * call Strip_trailing_whitespace()
endif

