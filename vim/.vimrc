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

function! MoveLinesMap()
    nnoremap    <leader><Up>    :m-2<cr>
    nnoremap    <leader><Down>  :m+1<cr>
endfunction

function! GitGutterFeature()
    nmap    ]c          <Plug>GitGutterNextHunk
    nmap    [c          <Plug>GitGutterPrevHunk
    nmap    <leader>hs  <Plug>GitGutterStageHunk
    nmap    <leader>hr  <Plug>GitGutterRevertHunk
    nmap    <leader>hp  <Plug>GitGutterPreviewHunk
endfunction

function! FugitiveFeature()
    nnoremap <F1>   :update<cr> :Git add %<cr> :Gstatus<cr>
    nnoremap <F2>   :Git push<cr>
endfunction

function! CtrlPMap()
    map         <leader>p   <Esc><c-p>
    nnoremap    <leader>v   :vnew<bar>CtrlP<cr>
endfunction

function! NerdTreeMap()
    nnoremap    <leader>o   <Esc>:NERDTreeToggle<cr>
endfunction

function! AgMap()
    nnoremap    <leader>/   :Ag<Space>""<left>
endfunction

function! HighlightOverlength(charLimit)
    " @todo - use charLimit
    highlight Overlength ctermbg=grey ctermfg=white guibg=#da5c34
    match Overlength /\%81v.\+/
endfunction

function! Solarized()
    " let g:solarized_contrast="low"
    " let g:solarized_visibility="high"
    let g:solarized_termcolors=256
    colorscheme solarized
endfunction

function! SyntasticFlags()
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
\       'must be prefixed with an underscore',
\       'doc comment',
\       'is not in camel caps format',
\       'Closing brace must be on a line by itself'
\   ]
\}

    let g:syntastic_php_phpmd_quiet_messages = {
\   'regex': [
\       'Avoid variables with short names like '
\   ]
\}
    nnoremap <leader>sc :SyntasticToggle<cr>
endfunction

function! IndentLineFlags()
    let g:indentLine_faster=1
endfunction

function! AgFlags()
    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
endfunction

function! GundoFlags()
    let g:gundo_width = 30
    let g:gundo_preview_height = 50
    let g:gundo_close_on_revert = 1
    nnoremap <leader>u :GundoToggle<cr>
endfunction

function! UltisnipsFlags()
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsListSnippets="<c-e>"
    let g:snips_author="Jeremy Seago <seagoj@gmail.com>"
    nnoremap <C-e> <Esc>:UltiSnipsEdit<cr>
endfunction

function! GistFlags()
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
endfunction

function! AirlineFlags()
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
endfunction

function! PIVFlags()
    " -PIV
    " let g:DisableAutoPHPFolding = 1
endfunction

function! DisableCursorKeysMap()
    map <up>    <nop>
    map <down>  <nop>
    map <left>  <nop>
    map <right> <nop>
endfunction

function! FixLineWrapNavigationMap()
    map j gj
    map k gk
endfunction

let vundleInstalled=AutoInstallVundle()

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
Bundle 'seagoj/buffer-selection.vim'
Bundle 'seagoj/tab-management.vim'
Bundle 'seagoj/whitespace.vim'
" Experimental
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'vim-scripts/localrc.vim'
Bundle 'spf13/PIV'
Bundle 'craigemery/vim-autotag'
" Colorschemes
Bundle 'chriskempson/tomorrow-theme'
Bundle 'noah/fu'
Bundle 'adlawson/sorcerer'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'altercation/solarized'
Bundle 'blerins/flattown'
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
" Colors
syntax enable       "Enable highlighting
set guioptions-=T
set t_Co=256
set background=dark
" colorscheme Tomorrow-Night-Eighties
call Solarized()
" hi Normal ctermbg=NONE
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
" Show current git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" Define Invisible Characters
set listchars=tab:¦\ ,extends:»,precedes:«,nbsp:×,eol:¬,trail:·

call HighlightOverlength(80)

" Specify Behavior For Switching Buffers
try
    set switchbuf=useopen,usetab,newtab
    set showtabline=2
catch
endtry

set pastetoggle=<leader>z

" Mappings
let mapleader   = ","
let g:mapleader = ","

call SyntasticFlags()
call IndentLineFlags()
call AgFlags()
call GundoFlags()
call UltisnipsFlags()
call GistFlags()
call AirlineFlags()
call PIVFlags()
call DisableCursorKeysMap()
call FixLineWrapNavigationMap()
call VimifyWindowSelectionMap()
call TabManagementMap()
call CtrlPMap()
call NerdTreeMap()
call AgMap()
call GitGutterFeature()
call FugitiveFeature()
call MoveLinesMap()

" Copy to clipboard
map         <leader>c       "*y
" Change CWD to directory of selected buffer
map         <leader>cd      :cd %:p:h<cr> :pwd<cr>
" Toggle Invisibles
map         <leader>l       :set list!<cr>
nnoremap    <leader>r       :RainbowParenthesesToggle<cr>
nmap        <leader>w       :retab!<cr> :update!<cr>
map         <leader>ev      :tabnew $MYVIMRC<cr>
nmap        <leader><space> :nohlsearch<cr>
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

" Autocommands
if has("autocmd")
    " vim mode-switch lag fix
    if ! has("gui_running")
        set guioptions-=T         " Remove toolbar
        set guioptions-=r         " Remove right scrollbar
        " set ttimeoutlen=10
        " augroup FastEscape
        "     autocmd!
        "     au InsertEnter * set timeoutlen=0
        "     au InsertLeave * set timeoutlen=1000
        " augroup END
    endif
    " Remove fugitive buffers when hidden
    autocmd BufReadPost fugitive://* set bufhidden=delete
    " -Return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    autocmd BufWritePost .vimrc source $MYVIMRC
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
