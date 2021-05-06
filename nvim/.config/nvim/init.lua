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
-- vim.cmd [[ set exrc ]]

vim.cmd [[ augroup bonfyre ]]
vim.cmd [[	 au BufNewFile,BufRead */bonfyre_app/** let g:vdebug_options.path_maps = {"/vagrant/bonfyre_app": "~/.local/src/bonfyre/config_management/puppet/bonfyre_app"} ]]
vim.cmd [[ augroup END ]]
