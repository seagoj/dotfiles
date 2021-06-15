line_length_max = 120
tab_width = 2

require 'config.general'
require 'config.coding'
require 'config.search'
require 'config.whitespace'
local t = require('config.t')

-- keymap
vim.api.nvim_set_keymap('n', t'<leader>r', ':Gsearch', { noremap = true })

-- vim.g.vdebug_options = {}
-- vim.g.vdebug_features = {}
-- vim.g.vdebug_options.port = 9000
-- vim.g.vdebug_features.max_depth = 2048
-- vim.g.vdebug_options.path_maps = [[ {"/vagrant/bonfyre_app": "~/.local/src/bonfyre/config_management/puppet/bonfyre_app"} ]]
