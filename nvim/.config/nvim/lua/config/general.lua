local api = vim.api

require 'config.font'
require 'config.plugins'

-- ## chrome
-- command height
api.nvim_set_option('cmdheight', 2)
-- automatically watch for changes
api.nvim_set_option('autoread', true)
-- hide unsaved files instead of forcing you to save/quit
api.nvim_set_option('hidden', true)
-- read config from first 5 lines
api.nvim_set_option('modelines', 5)
-- ctags location
api.nvim_set_option('tags', '.git/tags')
-- swap file locations
api.nvim_set_option('directory', '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp')
-- keymap timeout
api.nvim_set_option('timeoutlen', 500)
-- highlight cursor
api.nvim_set_option('cursorline', true)
api.nvim_set_option('cursorcolumn', true)
-- splits
api.nvim_set_option('splitright', true)
api.nvim_set_option('splitbelow', true)
-- specify behavior for switching buffers
api.nvim_set_option('switchbuf', 'useopen,usetab,newtab')
-- tabs
api.nvim_set_option('showtabline', 2)
-- no sound on errors
api.nvim_set_option('errorbells', false)
-- keep cursor more vertically centered
api.nvim_set_option('scrolloff', 5)
-- backspace
api.nvim_set_option('backspace', 'eol,start,indent')
-- paste mode
api.nvim_set_option('pastetoggle', '<leader>z')
-- undo
api.nvim_set_option('backup', false)
api.nvim_set_option('undodir', "~/.local/share/nvim/undo")
api.nvim_set_option('undofile', true)
-- use system clipboard
api.nvim_set_option('clipboard', 'unnamedplus')
-- autocompletion
api.nvim_set_option('wildmode', 'longest,list,full')
