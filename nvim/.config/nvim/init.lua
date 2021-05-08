line_length_max = 120
tab_width = 2

require 'config.general'
require 'config.coding'
require 'config.search'
require 'config.whitespace'
local t = require('config.t')

-- function t(str)
--	return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- keymap
vim.api.nvim_set_keymap('n', t'<leader>r', ':Gsearch', { noremap = true })
