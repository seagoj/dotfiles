" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' | Plug 'seagoj/fugitive-config.vim'
Plug 'seagoj/git-gutter-feature.vim'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' | Plug 'seagoj/gist-vim-config'
" Documentation browser
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux"
    Plug 'KabbAmine/zeavim.vim'
elseif !v:shell_error && s:uname == "Darwin"
    Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim' | Plug 'seagoj/dash-config.vim'
endif
" Syntax linter/autocompletion
" Plug 'scrooloose/syntastic' | Plug 'seagoj/syntastic-config.vim'
Plug 'w0rp/ale' | Plug 'maximbaz/lightline-ale' | Plug 'seagoj/ale-config'
Plug 'Valloric/YouCompleteMe', {'do': 'installYCM'}
" Snippet manager
Plug 'SirVer/ultisnips' | Plug 'seagoj/ultisnips-config.vim'
" Comments
Plug 'tpope/vim-commentary'
" visual indentation
Plug 'yggdroot/indentline' | Plug 'seagoj/indentline-config.vim'
" Icon set
Plug 'ryanoasis/vim-devicons'
" Project formatting
Plug 'editorconfig/editorconfig-vim'
" Project navigation
Plug 'tpope/vim-projectionist'
" Syntax highlighting
Plug 'sheerun/vim-polyglot' | Plug 'seagoj/vim-polyglot-config'
" Test runner
Plug 'janko-m/vim-test' | Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim' | Plug 'seagoj/vim-test-config'
Plug 'christoomey/vim-tmux-runner' | Plug 'gabeharms/tslime.vim'
Plug 'seagoj/overlength.vim'
Plug 'vim-vdebug/vdebug' | Plug 'seagoj/vdebug-config'
