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
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'majutsushi/tagbar'
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/cream-showinvisibles'
Bundle 'koron/minimap-vim'


" Auto-commands
"autocmd vimenter * if !argc() | :Unite file<cr> | endif
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let mapleader = ","
"let G:mapleader = ","
nmap <leader>w :w!<cr> "Map <leader>w to force write carriage return

" General
set mouse=a "Enable mouse use
set so=5 "When possible, show 5 lines above and below the cursor
set wildmenu "Autocomplete and fun stuff
set number
set cmdheight=2 "shortens cmd height
set backspace=eol,start,indent "backspace configuration
:au FocusLost * :wa "Auto save file when focus is lost

" Searching
set ignorecase "ignore case when searching
set smartcase "If a pattern contains an uppercase, then the search is case sensitive
set hlsearch "highlight searches
"set incsearch "more like webbrowser search
"set nolazyredraw "Don't redraw during macros
"set magic "For regular expressions
set showmatch " Matching braces highlighting
set mat=2 "Blink for above

" No sound on errors
set noerrorbells
set novisualbell
set visualbell
set t_vb=
set tm=500

" Colors
syntax enable "Enable highlighting 
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
set expandtab "Insert spaces whenever <tab> is pressed
set tabstop=4 "Use 4 spaces for a tab
set shiftwidth=4 "Change prior entered tabs to be 4 spaces
set smarttab "Manage spaces as if they were tabs
map <F3> :retab <CR> :w!<CR> "Maps <F2> to retab and write file

"set lbr
"set tw=500

set ai "Autoindent
set si "Smartindent

" Line Width and wrapping
"set wrap "Wrap lines
"set textwidth=80
"set tw=80
"highlight Overlength ctermbg=red ctermfg=white guibg=#592929
"match Overlength /\%81v.\+/

" Global vars
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
let g:unite_split_rule = 'topleft'
let g:unite_enable_split_vertically = 1
let g:unite_winheight = 45

" Mappings
nnoremap    <Space>         <PageDown>
nnoremap    <S-Space>       <PageUp>
nnoremap    <C-o>           :Unite          -no-split    -buffer-name=files     -start-insert   file_rec/async:!<cr>
nnoremap    <space>/        :Unite          grep:.<cr>
nnoremap    <space>y        :Unite          history/yank<cr>
nnoremap    <space>s        :Unite          -quick-match                                        buffer<cr>
nnoremap    <space>e        :Unite          -no-split    -buffer-name=buffer                    buffer<cr>
nnoremap    <space>r        :Unite          -no-split    -buffer-name=mru       -start-insert   file_mru<cr>
nnoremap    <space>o        :Unite          -no-split    -buffer-name=ooutline  -start-insert   outline<cr>
imap        jj              <Esc> :w!<CR>
imap        jk              <Esc>
map         <C-T>           :tabnew<CR>:e .<CR>
map         <C-PageDown>    gt
map         <C-PageUp>      gt
"map        <C-o>           :NERDTreeToggle<CR>
inoremap    {<CR>           {<cr><cr>}<C-o>k<tab>
""inoremap    (               ()<left>
""inoremap    [               []<left>
""inoremap    "               ""<left>
""inoremap    '               ''<left>
nnoremap    <F1>            :retab<CR> :wa<CR> :! git add . && git commit -a -m 'Testing' && git push origin release-1<CR>
nnoremap    <F2>            :wa<CR> :! vagrant-phpunit<CR>

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
