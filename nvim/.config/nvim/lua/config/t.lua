function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return t
