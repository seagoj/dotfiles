-- lsp
require'lspconfig'.pyright.setup{}

-- dap-python
if (vim.api.nvim_get_option('loadplugins')) then
	if (vim.fn.has('packages')) then
		vim.cmd [[ packadd! nvim-dap-python ]]
	end
end

-- NOTE: requires debugpy is installed for this instance
require('dap-python').setup('~/.asdf/shims/python')
require('dap-python').test_runner = 'unittest'
vim.api.nvim_set_keymap('n', t'<leader>dn', [[:lua require('dap-python').test_method()<CR>]], { noremap = true, silent = true })
