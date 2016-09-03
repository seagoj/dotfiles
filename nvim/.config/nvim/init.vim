scriptencoding utf-8
set encoding=utf-8
" set guifont=Sauce\ Code\ Powerline\ Semibold:h8
set guifont=Source\ Code\ Pro\ Semibold:h8
set ffs=unix,mac,dos
set nocompatible
filetype off

source $XDG_CONFIG_HOME/nvim/plugins.vim
source $XDG_CONFIG_HOME/nvim/keymap.vim

filetype plugin on
filetype indent on
set mouse=a						"Enable mouse use
set scrolloff=5					"When possible, show 5 lines above and below the cursor
set wildmenu					"Autocomplete and fun stuff
set number						"Show line numbers
set cmdheight=2					"shortens cmd height
set backspace=eol,start,indent	"backspace configuration
set autoread					"automatically watch for changes
set hidden						"hides unsaved files instead of forcing you to save/quit
set modelines=5
set laststatus=2
set tags=.git/tags
set nobackup
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Searching
set ignorecase		"ignore case when searching
set smartcase		"If a pattern contains an uppercase, then the search is case sensitive
set hlsearch		"Highlight searches
set incsearch		"More like webbrowser search
" set nolazyredraw	  "Don't redraw during macros
set magic			"For regular expressions
set showmatch		"Matching braces highlighting
set matchtime=2		"Blink for 2 tenths of a second when matching
" No Sound On Errors
set visualbell
set timeoutlen=500
" Indentation
set autoindent		"Newline uses indentation depth of the previous
set smartindent		"Newline conditionally uses 1 more indent
" Spaces/Tabs
" set tabstop=4		"Use 4 spaces for a tab
" set softtabstop=4	"Softtabstop?
" set shiftwidth=4	"Change prior entered tabs to be 4 spaces
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
set relativenumber
