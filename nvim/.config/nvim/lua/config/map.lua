local modes = {
	insert = 'i',
	normal = 'n',
	visual = 'v'
}

function map(mode, keymap, cmd, opts)
	local options = {noremap = true}
	if opts then 
		options = vim.tbl_extend('force', options, opts) 
	end

	api.nvim_set_keymap(mode, keymap, cmd, options)
end

return {
	imap = function (keymap, cmd, opts)
		map(modes.insert, keymap, cmd, opts)
	end,
	nmap = function (keymap, cmd, opts)
		map(modes.normal, keymap, cmd, opts)
	end,
	vmap = function (keymap, cmd, opts)
		map(modes.visual, keymap, cmd, opts)
	end
}
