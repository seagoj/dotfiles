local api = vim.api

line_length_max = 120
tab_width = 2

require 'config.general'
require 'config.coding'
require 'config.search'
require 'config.whitespace'

function t(str)
	return api.nvim_replace_termcodes(str, true, true, true)
end

-- keymak
api.nvim_set_keymap('n', t'<leader>r', ':Gsearch', { noremap = true })
-- php lsp
require 'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
require 'lspconfig'.vuels.setup{}
