local api = vim.api

-- use tabs of tab_width by default
api.nvim_set_option('tabstop', tab_width)
api.nvim_set_option('softtabstop', tab_width)
api.nvim_set_option('shiftwidth', tab_width)
api.nvim_set_option('expandtab', false)
-- endlines
api.nvim_set_option('fileformats', 'unix,mac,dos')
-- define invisible characters
api.nvim_set_option('listchars', 'tab:¦ ,extends:»,precedes:«,nbsp:×,eol:¬,trail:·')
-- indentation
api.nvim_set_option('autoindent', true)
api.nvim_set_option('smartindent', true)
vim.cmd [[set autoindent]]
vim.cmd [[set smartindent]]

-- TODO: figure out how to strip trailing whitespace

--[[
function! Strip_trailing_whitespace(...)
	if &ft =~ 'markdown'
		return
	endif
		%s/\s\+$//e
endfunction
--]]

-- autocmds
if vim.fn.has('autocmd') then
	vim.cmd [[autocmd BufWritePre * :retab!]]
	-- vim.cmd [[autocmd BufWritePre * lua strip_trailing_whitespace]]		
end
