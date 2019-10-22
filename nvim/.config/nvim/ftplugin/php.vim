packadd notreal
packadd! definitelynotreal

if &loadplugins
    if has('packages')
        packadd php.vim
        packadd phpcomplete.vim
        packadd phpfolding.vim
        packadd vdebug
        "" PHP-Expermimental
        packadd phpactor
        " packadd vim-php-refactoring-toolbox
        packadd vim-php-namespace | packadd vim-php-namespace-config.vim
        packadd vmustache | packadd pdv | packadd pdv-config.vim
    endif
endif
