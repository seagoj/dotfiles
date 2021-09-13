local nmap = require('config.map').nmap
local pack = require('config.pack').pack

opt.filetype = 'off'

-- BASE
-- brings back some vim niceties
pack 'astronauta.nvim'
-- open to last postiion in the file
pack 'last-position.vim'
-- statsubar
pack {'lightline.vim', 'lightline-config.vim', 'vim-devicons'}
-- undo
pack {'undotree', 'undotree-config.vim'}

-- # Buffers
pack 'buffers.vim'
pack { 'vim-tmux-navigator', 'vim-tmux-navigator-config' }
-- # Notes
-- pack	{ 'vimwiki', 'vimwiki-config.vim' }
pack	{
	-- 'vim-roam',
	'wiki.vim'
}
g.wiki_root = '~/vimwiki'
g.wiki_filetypes = { 'md' }
g.wiki_link_extension = '.md'

-- # Search
-- - Find/Replace
pack 'greplace.vim'
nmap([[<Leader>r]], [[:Gsearch]])
-- - search/file fuzzyfinding
pack {'fzf', 'fzf.vim', 'fzf-config.vim', 'rg.vim'}

-- DEVELOPMENT
-- -- dap
pack {'nvim-dap', 'nvim-dap-ui', 'nvim-dap-virtual-text'}
nmap([[<F2>]], [[:lua require('dap').step_into()<CR>]])
nmap([[<F3>]], [[:lua require('dap').step_over()<CR>]])
nmap([[<F5>]], [[:lua require('dap').continue()<CR>]])
nmap([[<F6>]], [[:lua require('dap').step_out()<CR>]])
nmap([[<F10>]], [[:lua require('dap').toggle_breakpoint()<CR>]])
nmap([[<F12>]], [[:lua require('dap').step_out()<CR>]])
nmap([[<Leader>db]], [[:lua require('dap').toggle_breakpoint()<CR>]])
nmap([[<Leader>dr]], [[:lua require('dap').repl.toggle()<CR>]])
nmap([[<Leader>dl]], [[:lua require('dap').run_last()<CR>]])
require('dapui').setup()
g.dap_virtual_text = true

-- lsp
pack 'nvim-lspconfig'
pack 'nvim-lsp'
opt.completeopt = 'menuone,noinsert,noselect'
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
pack 'completion-nvim'

-- comments
pack 'vim-commentary'
-- project navigation
pack {'fff.vim', 'fff-config.vim'}
pack 'vim-projectionist'
-- formatting
pack 'editorconfig-vim'
-- Handle paired characters
pack 'vim-surround'
pack 'auto-pairs-gentle'
-- git
pack {'vim-fugitive', 'fugitive-config.vim'}
-- Documentation browser
if fn.executable('zeal') then
	pack 'zeavim.vim'
elseif fn.executable('dash') then
	pack {'rizzatti/funcoo.vim', 'rizzatti/dash.vim', 'seagoj/dash-config.vim'}
end
-- Syntax linter/autocompletion
pack {'ale', 'lightline-ale', 'ale-config'}
-- Snippet manager
pack {'ultisnips', 'ultisnips-config.vim'}
-- visual indentation
pack {'indentline', 'indentline-config.vim'}
-- Syntax highlighting
-- colorscheme
-- add {'sourcerer-nvim', 'sourcerer-config.vim'}
pack 'nvcode-color-schemes.vim'
pack {'nvim-treesitter', 'nvim-treesitter-config', 'playground'}
-- Test runner
pack {'vim-test', 'vim-dispatch', 'vim-dispatch-neovim', 'vim-test-config', 'vim-tmux-runner', 'tslime.vim'}
-- Debugger
-- todo finder
pack 'qf-todo.vim'
-- preview colors
pack 'vim-hexokinase'

-- uml
pack {'plantuml-previewer.vim', 'plantuml-syntax', 'open-browser.vim'}

-- LANGUAGE SPECIFIC

return pack
