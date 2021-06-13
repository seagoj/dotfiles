local api = vim.api

-- ignore case during search
api.nvim_set_option('ignorecase', true)
-- unless a capital letter was used
api.nvim_set_option('smartcase', true)
-- highlight matches
api.nvim_set_option('hlsearch', true)
-- highlight partial matches
api.nvim_set_option('incsearch', true)
-- regex
api.nvim_set_option('magic', true)
-- ignore
api.nvim_set_option('wildignore', api.nvim_get_option('wildignore') .. "*/.git/*,*/tmp/*,*.swp")

-- autocmds
if vim.fn.has('autocmd') then
	if vim.fn.exists('##TextYankPost') then
		vim.cmd('autocmd TextYankPost * silent! lua require"vim.highlight".on_yank("IncSearch", 200)')
	end
end
