call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'seagoj/php.vim', {'for': 'php'}
    Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
    Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}

    " Expermimental
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    " Plug 'adoy/vim-php-refactoring-toolbox'
    Plug 'arnaud-lb/vim-php-namespace' | Plug 'seagoj/vim-php-namespace-config.vim'
    Plug 'tobyS/vmustache' | Plug 'YaroslavMolchan/pdv' | Plug 'seagoj/pdv-config.vim'
call plug#end()

autocmd FileType php setlocal omnifunc=phpactor#Complete
