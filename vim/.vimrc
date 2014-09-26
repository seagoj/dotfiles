" General
scriptencoding utf-8
set encoding=utf-8
set guifont=Sauce\ Code\ Powerline\ Semibold:h10
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
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'majutsushi/tagbar'
Bundle 'sjl/gundo.vim'
Bundle 'edsono/vim-matchit'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
" Bundle 'Shougo/unite.vim'
" Bundle 'Shougo/vimproc.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'yggdroot/indentline'
" Experimental
Bundle 'maksimr/vim-jsbeautify'
Bundle 'vim-scripts/localrc.vim'
Bundle 'vim-scripts/AutoClose'
Bundle 'spf13/PIV'
Bundle 'craigemery/vim-autotag'
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
" set nolazyredraw    "Don't redraw during macros
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
set splitright
" Statusline
" Show current git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Features
" Show Invisible Characters
" set list listchars=tab:¦\ ,extends:»,precedes:«,nbsp:×,eol:¬,trail:·
" Highlight Lines Longer Than 80 Characters
highlight Overlength ctermbg=grey ctermfg=white guibg=#da5c34
match Overlength /\%81v.\+/

" Specify Behavior For Switching Buffers
try
    set switchbuf=useopen,usetab,newtab
    set showtabline=2
catch
endtry

set pastetoggle=<leader>z

" Global vars
" -Syntastic
let g:syntastic_enable_signs=0
" let g:syntastic_echo_current_error=0
" let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_id_checkers = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {
\   'level': [],
\   'type': [],
\   'regex': [],
\   'file': []
\}
let g:syntastic_php_phpcs_quiet_messages =  {
\   'regex': [
\       'Line indented incorrectly;',
\       'Line exceeds 85 characters;',
\       'must be prefixed with an underscore'
\   ]
\}
let g:syntastic_php_phpmd_quiet_messages = {
\   'regex': [
\       'Avoid variables with short names like '
\   ]
\}
" -IndentLine
let g:indentLine_faster=1
" -Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_show_visibility = 1
let g:tagbar_autoshowtag = 1
" -Unite
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
" let g:unite_split_rule = 'bottom'
let g:unite_enable_split_vertically = 0
let g:unite_winheight = 20
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" -Gundo
let g:gundo_width = 30
let g:gundo_preview_height = 50
let g:gundo_close_on_revert = 1
" -Ultisnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:snips_author="Jeremy Seago <seagoj@gmail.com>"
" -Gist-vim
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
if executable('pbcopy')
    let g:gist_clip_command = 'pbcopy'
elseif executable('xclip')
    let g:gist_clip_command = 'xclip -selection clipboard'
elseif executable('putclip')
    let g:gist_clip_command = 'putclip'
endif
" -Indent Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1
" -Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" -PIV
" let g:DisableAutoPHPFolding = 1

" Mappings
let mapleader = ","
let g:mapleader = ","
nnoremap    ;               :
" -Disable Cursor Keys
map         <up>            <nop>
map         <down>          <nop>
map         <left>          <nop>
map         <right>         <nop>
" -Movement
" -Treat long lines as break lines
map         j               gj
map         k               gk
" Move between windows
map         <C-j>           <C-W>j
map         <C-k>           <C-W>k
map         <C-h>           <C-W>h
map         <C-l>           <C-W>l
" -Toggle Invisibles
map         <leader>l       :set list!<cr>
" -Tab Management
map         <leader>tn      :tabnew<cr><c-p>
map         <leader>to      :tabonly<cr>
map         <leader>tc      :tabclose<cr>
map         <leader>tm      :tabmove
map         <leader>ev      :tabnew $MYVIMRC<cr>
map         <leader>so      :so $MYVIMRC<cr>
" -Change CWD to directory of selected buffer
map         <leader>cd      :cd %:p:h<cr> :pwd<cr>
nnoremap    <leader>sc      :SyntasticToggle<cr>
nmap        <leader>w       :retab!<cr> :update!<cr>
map         <leader>p       <Esc><c-p>
nnoremap    <leader>o       <Esc>:NERDTreeToggle<cr>
nnoremap    <leader>/       :Ag<Space>
nnoremap    <leader>u       :GundoToggle<cr>
nmap        <leader><space> :nohlsearch<cr>
nnoremap    <leader>r       :RainbowParenthesesToggle<cr>
nnoremap    <leader>v       :vnew<cr>
imap        jj              <Esc>:update!<CR>
imap        jk              <Esc>
nnoremap    <F1>            :Gwrite<cr> :Gstatus<cr>
nnoremap    <F2>            :Git push<cr>
nnoremap    <F3>            :! phpunit && open tests/report/index.html<cr>
nnoremap    <F10>           <Esc>:TagbarToggle<cr>
nnoremap    <F12>           <Esc>:Dash!<cr>
" map         <C-]>           <Esc>"zyiw:TagbarOpenAutoClose<cr>:exe "/".@z.""<cr><cr>:nohlsearch<cr>
map         <C-]>           :call TagbarGotoTag()<cr>
nnoremap    <C-e>           <Esc>:UltiSnipsEdit<cr>
map         <C-o>           <Esc>:NERDTreeToggle<cr>
vmap        <               <gv
vmap        >               >gv
" nmap        0               0w
nmap        p               ]p
cmap        w!!             w !sudo tee % >/dev/null
nnoremap    <leader><Up>    :m-2<cr>
nnoremap    <leader><Down>  :m+1<cr>
" -Clone current paragraph
noremap     cp              yap<S-}>p
" -Align current paragraph
" noremap     <leader>a       =ip
" -GitGutter Mappings
nmap        ]c              <Plug>GitGutterNextHunk
nmap        [c              <Plug>GitGutterPrevHunk
nmap        <leader>hs      <Plug>GitGutterStageHunk
nmap        <leader>hr      <Plug>GitGutterRevertHunk
nmap        <leader>hp      <Plug>GitGutterPreviewHunk
map         <leader>c       "*y

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

" Finds the definition of the term under the cursor
function! TagbarGotoTag()
    normal! "zyiw:TagbarOpenAutoClose<cr>:exe "/".@z.""<cr><cr>:nohlsearch<cr>
endfunction

" Autocommands
if has("autocmd")
    " Autoopen NERDTree on load
    " autocmd vimenter * if !argc() | NERDTree | endif
    " Autoclose vim if only NERDTree is open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    " vim mode-switch lag fix
    if ! has("gui_running")
        set guioptions-=T         " Remove toolbar
        set guioptions-=r         " Remove right scrollbar
        set ttimeoutlen=10
        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END
    endif
    " Remove fugitive buffers when hidden
    autocmd BufReadPost fugitive://* set bufhidden=delete
    " -Remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e
    " -Return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    autocmd BufWritePost .vimrc source $MYVIMRC
    " autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
endif

" if &diff
    " diff mode
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
    set diffopt+=iwhite
    map     <leader><       :diffget //2<cr>:diffupdate<cr>]c
    map     <leader>>       :diffget //3<cr>:diffupdate<cr>]c
" endif
" :cd ~/code
