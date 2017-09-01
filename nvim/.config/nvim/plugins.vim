function! AutoInstallVimPlug()
	let vimPlugInstalled=1
	let vimPlugFile=expand("$XDG_CONFIG_HOME/nvim/autoload/plug.vim")
	if !filereadable(vimPlugFile)
		echo "Installing vim-plug..."
		!curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		let vimPlugInstalled=0
	endif
	return vimPlugInstalled
endfunction

let vimPlugInstalled=AutoInstallVimPlug()
let s:uname = system("echo -n \"$(uname)\"")

call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
Plug 'airblade/vim-gitgutter'
if !v:shell_error && s:uname == "Linux"
Plug 'KabbAmine/zeavim.vim'
elseif !v:shell_error && s:uname == "Darwin"
Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim' | Plug 'seagoj/dash-config.vim'
endif
Plug 'sjl/gundo.vim' | Plug 'seagoj/gundo-config.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'rking/ag.vim' | Plug 'seagoj/ag-config.vim'
Plug 'scrooloose/syntastic' | Plug 'seagoj/syntastic-config.vim'
Plug 'kien/ctrlp.vim' "| Plug 'lucidstack/ctrlp-mpc.vim' | Plug 'seagoj/ctrlp-mpc-config.vim'
Plug 'ervandew/supertab' | Plug 'SirVer/ultisnips' | Plug 'seagoj/ultisnips-config.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' | Plug 'seagoj/fugitive-config.vim'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': 'installYCM'}
" Plug 'yggdroot/indentline' | Plug 'seagoj/indentline-config.vim'
Plug 'seagoj/autosource-vimrc.vim'
Plug 'seagoj/buffers.vim'
Plug 'seagoj/disable-cursor-keys.vim'
Plug 'seagoj/git-gutter-feature.vim'
Plug 'seagoj/last-position.vim'
Plug 'seagoj/line-wrap-navigation.vim'
Plug 'seagoj/overlength.vim'
Plug 'seagoj/tab-management.vim'
Plug 'seagoj/whitespace.vim' | Plug 'seagoj/whitespace-config.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'maksimr/vim-jsbeautify'
Plug 'craigemery/vim-autotag'
Plug 'xero/sourcerer.vim' | Plug 'seagoj/sourcerer-config.vim'
Plug 'seagoj/airline-config.vim' | Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'chase/vim-ansible-yaml'
Plug 'junegunn/vader.vim'
Plug 'joonty/vdebug', {'tag': 'v1.5.1'}
Plug 'ryanoasis/vim-devicons'
Plug 'seagoj/vagrant.vim'
Plug 'seagoj/markdown.vim'
Plug 'seagoj/javascript.vim'
Plug 'seagoj/c.vim'
Plug 'seagoj/php.vim'
Plug 'seagoj/rust-config.vim'
Plug 'rust-lang/rust.vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'thalesmello/tabfold'
Plug 'rodjek/vim-puppet'
" Experimental
Plug 'IN3D/vim-raml'
Plug 'dahu/bisectly'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'google/vim-coverage' | Plug 'google/vim-maktaba' | Plug 'google/vim-glaive' | Plug 'seagoj/vim-coverage-config.vim'
call plug#end()

if vimPlugInstalled == 0
	:PlugInstall
endif

let g:vdebug_options = {'path_maps' : {"/vagrant/bonfyre_app": "/Users/seagoj/code/config_management/puppet/bonfyre_app"} }
