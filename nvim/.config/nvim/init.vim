" # general
" abandon VI backward compatibility
set nocompatible
" - utf-8 encoding
scriptencoding utf-8
set encoding=utf-8
" - font
set guifont=FiraCode\ Nerd\ Font\ Mono\ Regular:h8
" - language providers
let g:python_host_prog = 'python2'
let g:python2_host_prog = 'python2'
let g:python3_host_prog = 'python3'
let g:ruby_host_prog = 'ruby'
" - plugins
call plugin#init()

" # chrome
" set mouse=a                     " Enable mouse use
set number relativenumber       " show relative line numbers
set cmdheight=2                 " shortens cmd height
set autoread                    " automatically watch for changes
set hidden                      " hides unsaved files instead of forcing you to save/quit
set modelines=5                 " look for modeline commands in first and last 5 lines of file
set tags=.git/tags              " set location of ctags
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " swap file locations
set timeoutlen=500              " ms to wait for a keymap to complete
" - cursor
set cursorline cursorcolumn    " highlight cursor
" - splits
set splitright splitbelow      " splits get created to the right or below current buffer
" - define invisible characters
set listchars=tab:¦\ ,extends:»,precedes:«,nbsp:×,eol:¬,trail:·
" specify behavior for switching buffers
set switchbuf=useopen,usetab,newtab
" - tabs
set showtabline=2
" - errors
set noerrorbells                " no sound on errors
set scrolloff=5                 " When possible, show 5 lines above and below the cursor
set backspace=eol,start,indent  " backspace configuration
set pastetoggle=<leader>z
" - undo
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile
" - use system clipboard
set clipboard=unnamedplus
" - autocompletion
set wildmode=longest,list,full

" # text editing
" - searching
set ignorecase  smartcase       " If a pattern contains an uppercase, then the search is case sensitive
set hlsearch        " Highlight searches
set incsearch       " More like webbrowser search
set magic           " For regular expressions
" - indentation
set autoindent      " Newline uses indentation depth of the previous
set smartindent     " Newline conditionally uses 1 more indent
" - whitespace
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab  " use 4 spaces for tabs
set fileformats=unix,mac,dos " order of EOL character preference
" indicate long lines
set colorcolumn=120

" # code editing
" - syntax highlighting
syntax on
" - folding
set foldmethod=indent foldnestmax=10 foldenable foldlevel=1 foldlevelstart=1
" - character matching
set showmatch       "Matching braces highlighting
set matchtime=2     "Blink for 2 tenths of a second when matching
" - use project specific settings
set exrc secure
" use 24 bit colors in terminal
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
" ignore files when searching, expanding and globbing
set wildignore+=*/.git/*,*/tmp/*,*.swp

function! Strip_trailing_whitespace(...)
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfunction

if has("autocmd")
    autocmd BufWritePre * :retab! " auto convert whitespace
    autocmd BufWritePre * call Strip_trailing_whitespace()
endif

nnoremap <leader>r :Gsearch
