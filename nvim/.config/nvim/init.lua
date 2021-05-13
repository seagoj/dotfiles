line_length_max = 120
tab_width = 2

require 'config.general'
require 'config.coding'
require 'config.search'
require 'config.whitespace'
local t = require('config.t')

-- keymap
vim.api.nvim_set_keymap('n', t'<leader>r', ':Gsearch', { noremap = true })
