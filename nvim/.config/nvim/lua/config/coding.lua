local api = vim.api

-- - line numbers
api.nvim_set_option('number', true)
api.nvim_set_option('relativenumber', true)
-- - max line length guide
api.nvim_set_option('colorcolumn', tostring(line_length_max))
-- - syntax highlighting
api.nvim_set_option('syntax', 'off')
-- - folding
-- -- use treesitter for code folding
api.nvim_set_option('foldmethod', 'expr')
api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

-- - pair matching
api.nvim_set_option('showmatch', true)
-- - blink for 200 ms on match
api.nvim_set_option('matchtime', 2)
-- - allow project specific settings
api.nvim_set_option('exrc', true)
api.nvim_set_option('secure', true)
-- - 24 bit colors
vim['&t_8f'] = '<Esc>[38;2;%lu;%lu;%lum'
vim['&t_8b'] = '<Esc>[38;2;%lu;%lu;%lum'
api.nvim_set_option('termguicolors', true)
