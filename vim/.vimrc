call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

let mapleader = ","
"let G:mapleader = ","
nmap <leader>w :w!<cr> "Map <leader>w to force write carriage return

" General
set number "Enable line numbers
set mouse=a "Enable mouse use
set so=5 "When possible, show 5 lines above and below the cursor
set wildmenu "Autocomplete and fun stuff
set ruler "Always show current position
set cmdheight=2 "shortens cmd height
set backspace=eol,start,indent "backspace configuration

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
set nonu

" Spaces/Tabs
set expandtab "Insert spaces whenever <tab> is pressed
set tabstop=4 "Use 4 spaces for a tab
set shiftwidth=4 "Change prior entered tabs to be 4 spaces
set smarttab "Manage spaces as if they were tabs
map <F2> :retab <CR> :w!<CR> "Maps <F2> to retab and write file

"set lbr
"set tw=500

set ai "Autoindent
set si "Smartindent

" Line Width and wrapping
set wrap "Wrap lines
set textwidth=80
set tw=80
highlight Overlength ctermbg=red ctermfg=white guibg=#592929
match Overlength /\%81v.\+/

" Mappings
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>
imap jj <Esc> :w!<CR>
map <C-T> :tabnew<CR>
map <C-PageDown> gt
map <C-PageUp> gt
"map <C-S> :w!

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