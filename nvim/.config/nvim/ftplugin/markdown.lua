-- packadd vim-composer | packadd vim-dispatch | packadd vim-dispatch-neovim
-- packadd vim-markdown-composer
-- let g:markdown_composer_browser="/home/jseago/.local/bin/firefox"
-- echo g:markdown_composer_browser
-- packadd vim-markdown

local nmap = require('config.map').nmap

-- render markdown
nmap([[<Leader>m]], [[:!markdown % > %.html<CR>:vsplit %.html<CR>]])
