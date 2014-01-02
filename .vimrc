set nocompatible
filetype plugin on
set modelines=5
set ls=2

"set guifont=Anonymous\ Pro\ for\ Powerline:h14
set tags=~/.vim/tags

set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'majutsushi/tagbar'
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/cream-showinvisibles'
Bundle 'koron/minimap-vim'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'

" Auto-commands
"autocmd vimenter * if !argc() | :Unite file<cr> | endif
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == \"primary\") | q | endif

let mapleader = ","
"let G:mapleader = ","
nmap <leader>w :w!<cr> "Map <leader>w to force write carriage return

" General
set mouse=a                     "Enable mouse use
set so=5                        "When possible, show 5 lines above and below the cursor
set wildmenu                    "Autocomplete and fun stuff
set number
set cmdheight=2                 "shortens cmd height
set backspace=eol,start,indent  "backspace configuration
":au FocusLost * :wa            "Auto save file when focus is lost

" Searching
set ignorecase                  "ignore case when searching
set smartcase                   "if a pattern contains an uppercase, then the search is case sensitive
set hlsearch                    "highlight searches
set incsearch                   "more like webbrowser search
set nolazyredraw                "Don't redraw during macros
set magic                       "For regular expressions
set showmatch                   "Matching braces highlighting
set mat=2                       "Blink for above

" No sound on errors
set noerrorbells
set novisualbell
set visualbell
set t_vb=
set tm=500

" Colors
syntax enable                   "Enable highlighting 
set guioptions-=T 
set t_Co=256 
set background=dark 
"colorscheme lucius
"colorscheme zenburn
"colorscheme jellybeans
"colorscheme wombat256
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Blue
colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night
"colorscheme Tomorrow
"set nonu

" Spaces/Tabs
set expandtab                   "Insert spaces whenever <tab> is pressed
set tabstop=4                   "Use 4 spaces for a tab
set shiftwidth=4                "Change prior entered tabs to be 4 spaces
set smarttab                    "Manage spaces as if they were tabs
"map <F3> :retab <CR> :w!<CR> "Maps <F2> to retab and write file

"set lbr
"set tw=500

set autoindent                  "newline uses indentation depth of the previous
set smartindent                 "newline conditionally uses 1 more indent

" Misc
set autoread                    "automatically watch for changes
set hidden                      "hides unsaved files instead of forcing you to save/quit

" Line Width and wrapping
"set wrap "Wrap lines
"set textwidth=80
"set tw=80
"highlight Overlength ctermbg=red ctermfg=white guibg=#592929
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
map         <C-T>           :tabnew<CR>:e .<CR>
map         <C-PageDown>    gt
map         <C-PageUp>      gt
nnoremap    <F1>            :wa<CR> :! $HOME/bin/bot-deploy<CR>
nnoremap    <F2>            :wa<CR> :! vagrant-phpunit<CR>
nnoremap    <F5>            :GundoToggle<cr>

" Autocomplete
inoremap    {<CR>           {<cr><cr>}<C-o>k<tab>
inoremap    (               ()<left>
inoremap    [               []<left>
inoremap    "               ""<left>
inoremap    '               ''<left>

"noremap <silent> <C-S>          :update<CR>
"vnoremap <silent> <C-S>         <C-C>:update<CR>
"inoremap <silent> <C-S>         <C-O>:update<CR>

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Catch trailing whitespace
"set listchars=tab:>-,trail: ,eol:$
"nmap <silent> <leader>s :set nolist!<CR>

" Tab navigation
map <silent> <D-PageDown> :tabn<CR>
map <silent> <D-PageUp> :tabp<CR>
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabN 2<cr>

" Code Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
