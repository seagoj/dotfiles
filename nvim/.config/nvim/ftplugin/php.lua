-- dap
local dap = require('dap')
dap.adapters.php = {
	type = 'executable',
	command = 'node',
	args = {"/home/seagoj/.local/src/vscode-php-debug/out/phpDebug.js"}
}

dap.configurations.php = {
	{
		type = 'php',
		request = 'launch',
		name = 'Listen for xdebug',
		port = '9000',
		log = true,
		serviceSourceRoot = '/vagrant/bonfyre_app',
		localSourceRoot = '/home/seagoj/.local/src/bonfyre/config_management/bonfyre_app'
	}
}
-- lsp
require 'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
