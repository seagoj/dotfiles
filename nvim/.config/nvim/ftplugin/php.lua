-- dap
local user_source_path = os.getenv("XDG_SOURCE_HOME") or os.getenv("HOME") .. "/.local/src"
local service_source_root = os.getenv("VAGRANT_PROJECT_ROOT") or "/vagarant"
local local_source_root = os.getenv("HOST_PROJECT_ROOT") or os.getenv("PWD")

local dap = require('dap')
dap.adapters.php = {
	type = 'executable',
	command = 'node',
	args = { user_source_path .. "/vscode-php-debug/out/phpDebug.js" }
}
dap.configurations.php = {
	{
		type = 'php',
		request = 'launch',
		name = 'Listen for Xdebug',
		port = 9000,
		log = true,
		serviceSourceRoot = service_source_root,
		localSourceRoot = local_source_root
	}
}

-- lsp
require 'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
