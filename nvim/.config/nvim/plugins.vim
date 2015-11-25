function! AutoInstallVimPlug()
    let vimPlugInstalled=1
    let vimPlugFile=expand("$XDG_CONFIG_HOME/nvim/autoload/plug.vim")
    if !filereadable(vimPlugFile)
        echo "Installing vim-plug..."
        silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let vimPlugInstalled=0
    endif
    return vimPlugInstalled
endfunction

let vimPlugInstalled=AutoInstallVimPlug()

call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
Plug 'airblade/vim-gitgutter'
Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim' | Plug 'seagoj/gundo-config.vim'
Plug 'edsono/vim-matchit'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim' | Plug 'seagoj/gist-config.vim'
Plug 'rking/ag.vim' | Plug 'seagoj/ag-config.vim'
Plug 'scrooloose/syntastic' | Plug 'seagoj/syntastic-config.vim'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab' | Plug 'SirVer/ultisnips' | Plug 'seagoj/ultisnips-config.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' | Plug 'seagoj/fugitive-config.vim'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline' | Plug 'seagoj/indentline-config.vim'
Plug 'seagoj/autosource-vimrc.vim'
Plug 'seagoj/buffers.vim'
Plug 'seagoj/disable-cursor-keys.vim'
Plug 'seagoj/git-gutter-feature.vim'
Plug 'seagoj/last-position.vim'
Plug 'seagoj/line-wrap-navigation.vim'
Plug 'seagoj/overlength.vim'
Plug 'seagoj/tab-management.vim'
Plug 'seagoj/whitespace.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-scripts/localrc.vim'
Plug 'craigemery/vim-autotag'
" Plug 'chriskempson/tomorrow-theme' | Plug 'seagoj/tomorrow-night-config.vim'
" Plug 'altercation/solarized' | Plug 'seagoj/solarized-config.vim'
Plug 'xero/sourcerer.vim' | Plug 'seagoj/sourcerer-config.vim'
Plug 'seagoj/airline-config.vim' | Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'neilagabriel/vim-geeknote'
call plug#end()

if vimPlugInstalled == 0
    :PlugInstall
endif
