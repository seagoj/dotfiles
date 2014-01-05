" General
scriptencoding utf-8
set encoding=utf-8
set ffs=unix,mac,dos
set nocompatible
filetype plugin on
filetype indent on
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
set tags=~/.vim/tags
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set rtp+=$HOME/.vim/bundle/vundle/

call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'rking/ag.vim'
Bundle 'vim-scripts/cream-showinvisibles'
Bundle 'koron/minimap-vim'
Bundle 'sjl/gundo.vim'

let mapleader = ","
let g:mapleader = ","
" Auto-commands
" -Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" -Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Movement
" -Treat long lines as break lines
map j gj
map k gk
" -Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" -Tab Management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" - Change CWD to directory of selected buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" -Specify Behavior For Switching Buffers
try
    set switchbuf=useopen,usetab,newtab
    set showtabline=2
catch
endtry
" -Remember Info About Open Buffers On Close
"set viminfo=$HOME/.viminfo

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
set shiftwidth=4    "Change prior entered tabs to be 4 spaces
set smarttab        "Manage spaces as if they were tabs
set autoindent      "Newline uses indentation depth of the previous
set smartindent     "Newline conditionally uses 1 more indent

" Code Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"set textwidth=80 wrap linebreak nolist     "Wrap lines longer than 80 characters
"highlight Overlength ctermbg=blue ctermfg=white guibg=#592929
"match Overlength /\%81v.\+/

" Global vars
" -Unite
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
let g:unite_split_rule = 'topleft'
let g:unite_enable_split_vertically = 1
let g:unite_winheight = 45
" -Gundo
let g:gundo_width = 30
let g:gundo_preview_height = 50
let g:gundo_close_on_revert = 1
" -AG
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

" Mappings
nmap        <leader>w       :update!<cr> "Map <leader>w to force write carriage return
nnoremap    <Space>         <PageDown>
nnoremap    <S-Space>       <PageUp>
nnoremap    <C-p>           :Unite -no-split -buffer-name=files -start-insert -auto-preview file_rec/async:!<cr>
nnoremap    <C-o>           :Unite -no-split -buffer-name=files -start-insert -auto-preview file_rec:!<cr>
nnoremap    <space>/        :Unite grep:.<cr>
nnoremap    <space>y        :Unite history/yank<cr>
nnoremap    <space>s        :Unite -no-split -auto-preview -quick-match buffer<cr>
nnoremap    <space>e        :Unite -no-split -buffer-name=buffer buffer<cr>
nnoremap    <space>r        :Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap    <space>o        :Unite -no-split -buffer-name=ooutline -start-insert outline<cr>
imap        jj              <Esc> :w!<CR>
imap        jk              <Esc>
map         <C-t>           :tabnew<CR><C-p>
map         <C-PageDown>    gt
map         <C-PageUp>      gT
"nnoremap    <F1>            :wa<CR> :! $HOME/bin/bot-deploy<CR>
nnoremap    <F1>            :Gwrite<CR> :Gcommit<CR> :Git push development<CR>
nnoremap    <F2>            :Gwrite<CR> :Gcommit<CR> :Git push staging<CR>
"nnoremap    <F2>            :wa<CR> :! vagrant-phpunit<CR>
map         <F3>            :retab<CR>:w!<CR>       "Maps <F2> to retab and write file
nnoremap    <F5>            :GundoToggle<cr>
" -Autocomplete
inoremap    {<CR>           {<CR><CR>}<C-o>k<tab>
"inoremap    (               ()<left>
"inoremap    [               []<left>
"inoremap    "               ""<left>
"inoremap    '               ''<left>
" -Tab Navigation
"map <silent> <C-PageDown> :tabn<CR>
"map <silent> <C-PageUp> :tabp<CR>
map <silent> <C-1> :tabn 1<cr>
map <silent> <C-2> :tabN 2<cr>

:cd ~/code/bot
