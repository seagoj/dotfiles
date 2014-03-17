" General
scriptencoding utf-8
set encoding=utf-8
set ffs=unix,mac,dos
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/vundle/

" Check For Vundle
let vundleInstalled=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundleInstalled=0
endif
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'airblade/vim-gitgutter'
Bundle 'edsono/vim-matchit'
Bundle 'koron/minimap-vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rking/ag.vim'
Bundle 'rstacruz/sparkup', {'rtp':'vim/'}
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tobyS/pdv'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
filetype plugin on
filetype indent on
if vundleInstalled == 0
    :BundleInstall
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
set tags=./tags
set nobackup
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Searching
set ignorecase      "ignore case when searching
set smartcase       "If a pattern contains an uppercase, then the search is case sensitive
set hlsearch        "Highlight searches
set incsearch       "More like webbrowser search
set nolazyredraw    "Don't redraw during macros
set magic           "For regular expressions
set showmatch       "Matching braces highlighting
set matchtime=2     "Blink for 2 tenths of a second when matching
" No Sound On Errors
set visualbell
set timeoutlen=500
" Colors
syntax enable       "Enable highlighting
set guioptions-=T
set t_Co=256
set background=dark
colorscheme Tomorrow-Night-Eighties
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

" Statusline
" Show current git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Features
" Show Invisible Characters
set list listchars=tab:¦\ ,extends:»,precedes:«,nbsp:×,eol:¬,trail:·
" Highlight Lines Longer Than 80 Characters
highlight Overlength ctermbg=grey ctermfg=white guibg=#da5c34
match Overlength /\%81v.\+/

" Specify Behavior For Switching Buffers
try
    set switchbuf=useopen,usetab,newtab
    set showtabline=2
catch
endtry

set pastetoggle=<F11>

" Global vars
" -Unite
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
" let g:unite_split_rule = 'topleft'
let g:unite_enable_split_vertically = 0
" let g:unite_winheight = 20
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
" -Gundo
let g:gundo_width = 30
let g:gundo_preview_height = 50
let g:gundo_close_on_revert = 1
" -Sparkup
let g:sparkupArgs = '--no-last-newline'
let g:sparkupExecuteMapping = '<c-z>'
let g:sparkupNextMapping = '<c-x>'
" -Ultisnips
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsExpandTrigger="<c-e>"

" Mappings
let mapleader = ","
let g:mapleader = ","
nnoremap    ;               :
" Disable Cursor Keys
map         <up>            <nop>
map         <down>          <nop>
map         <left>          <nop>
map         <right>         <nop>
" Use Standard Regex
nnoremap    /               /\v
vnoremap    /               /\v
" Movement
" Treat long lines as break lines
map         j               gj
map         k               gk
" Move between windows
map         <C-j>           <C-W>j
map         <C-k>           <C-W>k
map         <C-h>           <C-W>h
map         <C-l>           <C-W>l
" Toggle Invisibles
map         <leader>l       :set list!<cr>
" Tab Management
map         <leader>tn      :tabnew<cr> <C-p>
map         <leader>to      :tabonly<cr>
map         <leader>tc      :tabclose<cr>
map         <leader>tm      :tabmove
" Change CWD to directory of selected buffer
map         <leader>ev      :e $MYVIMRC<cr>
map         <leader>so      :so $MYVIMRC<cr>
map         <leader>cd      :cd %:p:h<cr> :pwd<cr>
nmap        <leader>w       :retab!<cr> :update!<cr>
nnoremap    <leader>p       :Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap    <leader>/       :Unite grep:.<cr>
nnoremap    <leader>y       :Unite history/yank<cr>
nnoremap    <leader>s       :Unite -no-split -auto-preview -quick-match buffer<cr>
nnoremap    <leader>e       :Unite -no-split -buffer-name=buffer buffer<cr>
nnoremap    <leader>o       :Unite -no-split -buffer-name=ooutline -start-insert outline<cr>
nnoremap    <leader>u       :GundoToggle<cr>
nmap        <leader><space> :nohlsearch<cr>
nnoremap    <leader>r       :RainbowParenthesesToggle<cr>
imap        jj              <Esc> :retab!<cr> :update!<CR>
imap        jk              <Esc>
nnoremap    <F1>            :Gwrite<cr> :Gstatus<cr>
nnoremap    <F2>            :Git push<cr>
nnoremap    <F12>           <Esc>:Dash!<cr>
vmap        <               <gv
vmap        >               >gv
nmap        p               ]p
cmap        w!!             w !sudo tee % >/dev/null
if &diff
    " diff mode
    set diffopt+=iwhite
    map     <leader><       :diffget //2
    map     <leader>>       :diffget //3
endif

" Autocommands
if has("autocmd")
    " Remove fugitive buffers when hidden
    autocmd BufReadPost fugitive://* set bufhidden=delete
    " convert spaces to tabs when reading file
    autocmd! bufreadpost * set noexpandtab | retab! 4
    " convert tabs to spaces before writing file
    autocmd! bufwritepre * set expandtab | retab! 4
    " convert spaces to tabs after writing file (to show guides again)
    autocmd! bufwritepost * set noexpandtab | retab! 4)
    " -Remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e
    " -Retab on write
    autocmd BufWritePre * :retab!
    " -Return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    " Save Files On Focus Change
    autocmd FocusLost * <Esc>:wa
    " autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
    autocmd BufWritePost .vimrc source $MYVIMRC
endif
