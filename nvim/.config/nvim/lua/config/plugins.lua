local api = vim.api
local t = require('config.t')

require 'config.language-providers'

-- vim.call('plugin#init')

api.nvim_set_option('filetype', 'off')

function basePackages()
	-- brings back some vim niceties
	vim.cmd [[ packadd! astronauta.nvim ]]
	-- vim.cmd('packadd! sourcerer-nvim | packadd! sourcerer-config.vim')
	-- open to last postiion in the file
	vim.cmd('packadd! last-position.vim')
	-- statsubar
	vim.cmd('packadd! lightline.vim | packadd! lightline-config.vim | packadd! vim-devicons')
	-- undo
	vim.cmd('packadd! undotree | packadd! undotree-config.vim')

	-- # Buffers
	vim.cmd('packadd! buffers.vim')
	vim.cmd('packadd! vim-tmux-navigator | packadd! vim-tmux-navigator-config')
	-- # Notes
	vim.cmd('packadd! vimwiki | packadd! vimwiki-config.vim')

	-- # Search
	-- - Find/Replace
	vim.cmd('packadd! greplace.vim')
	-- - search/file fuzzyfinding
	vim.cmd('packadd fzf | packadd! fzf.vim | packadd! fzf-config.vim | packadd! rg.vim')
end

function developmentPackages()
	-- -- dap
	-- vim.cmd [[ packadd! nvim-dap ]]
	-- vim.cmd [[ packadd! nvim-dap-ui ]]
	-- vim.cmd [[ packadd! nvim-dap-virtual-text ]]

	-- vim.cmd [[ nnoremap <F2> :lua require('dap').step_into()<CR> ]]
	-- vim.cmd [[ nnoremap <F3> :lua require('dap').step_over()<CR> ]]
	-- vim.cmd [[ nnoremap <F5> :lua require('dap').continue()<CR> ]]
	-- vim.cmd [[ nnoremap <F6> :lua require('dap').step_out()<CR> ]]
	-- vim.cmd [[ nnoremap <F10> :lua require('dap').toggle_breakpoint()<CR> ]]
	-- vim.cmd [[ nnoremap <F12> :lua require('dap').step_out()<CR> ]]
	-- vim.cmd [[ nnoremap <leader>db :lua require('dap').toggle_breakpoint()<CR> ]]
	-- vim.cmd [[ nnoremap <leader>dr :lua require('dap').repl.toggle()<CR> ]]
	-- vim.cmd [[ nnoremap <leader>dl :lua require('dap').run_last()<CR> ]]
	-- -- require('dapui').setup()
	-- vim.g.dap_virtual_text = true

	vim.cmd [[ packadd vdebug ]]
	vim.g.vdebug_options = { port = 9000, path_maps =  [[ {"/vagrant/bonfyre_app": "~/.local/src/bonfyre/config_management/puppet/bonfyre_app"} ]] }
	-- vim.g.vdebug_features.max_depth = 2048
	-- vim.g.vdebug_options.path_maps = [[ {"/vagrant/bonfyre_app": "~/.local/src/bonfyre/config_management/puppet/bonfyre_app"} ]]

	-- lsp
	vim.cmd('packadd! nvim-lspconfig')
	vim.cmd('packadd! nvim-lsp')
	vim.cmd [[ set completeopt=menuone,noinsert,noselect ]]
	vim.cmd [[ let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy'] ]]
	vim.cmd('packadd! completion-nvim')

	-- comments
	vim.cmd('packadd! vim-commentary')
	-- project navigation
	vim.cmd('packadd! fff.vim | packadd! fff-config.vim')
	vim.cmd('packadd! vim-projectionist')
	-- formatting
	vim.cmd('packadd! editorconfig-vim')
	-- Handle paired characters
	vim.cmd('packadd! vim-surround')
	vim.cmd('packadd! auto-pairs-gentle')
	-- git
	vim.cmd('packadd! vim-fugitive | packadd! fugitive-config.vim')
	-- Documentation browser
	if vim.fn.executable('zeal') then
		vim.cmd('packadd! zeavim.vim')
	elseif vim.fn.executable('dash') then
		vim.cmd('packadd! rizzatti/funcoo.vim | packadd! rizzatti/dash.vim | packadd! seagoj/dash-config.vim')
	end
	-- Syntax linter/autocompletion
	vim.cmd('packadd! ale | packadd! lightline-ale | packadd! ale-config')
	-- packadd! coc.nvim | packadd! coc-config.vim " :CocInstall coc-phpls
	-- packadd! Valloric/YouCompleteMe', {'do': function('ycm#build')})
	-- Snippet manager
	vim.cmd('packadd! ultisnips | packadd! ultisnips-config.vim')
	-- visual indentation
	vim.cmd('packadd! indentline | packadd! indentline-config.vim')
	-- Syntax highlighting
	-- packadd! vim-polyglot "| packadd! vim-polyglot-config
	-- colorscheme
	-- vim.cmd('packadd! sourcerer-nvim')
	-- require 'sourcerer'
	vim.cmd('packadd! nvcode-color-schemes.vim')
	vim.cmd [[ packadd! nvim-treesitter ]]
	vim.cmd [[ packadd! nvim-treesitter-config ]]
	vim.cmd [[ packadd! playground ]]
	-- Test runner
	vim.cmd('packadd! vim-test | packadd! vim-dispatch | packadd! vim-dispatch-neovim | packadd! vim-test-config')
	vim.cmd('packadd! vim-tmux-runner | packadd! tslime.vim')
	-- Debugger
	-- todo finder
	vim.cmd('packadd! qf-todo.vim')
	-- preview colors
	vim.cmd('packadd! vim-hexokinase')

	-- uml
	vim.cmd('packadd! plantuml-previewer.vim | packadd! plantuml-syntax | packadd! open-browser.vim')
end

function languageSpecificPackages()
	-- c
	vim.cmd('packadd! c.vim')
	-- php
	-- -- psr-2 formatting
	-- vim.cmd('packadd! php.vim')
	-- enhanced autocompletion
	-- vim.cmd('packadd! phpcomplete.vim')
	-- fold comments with code
	-- vim.cmd('packadd! phpfolding.vim')
	-- - PHP-Expermimental
	-- vim.cmd('packadd! phpactor')
	-- Auto generate `use` statements
	-- vim.cmd('packadd! vim-php-namespace | packadd! vim-php-namespace-config.vim')
	-- documentor
	-- vim.cmd('packadd! vmustache | packadd! pdv | packadd! pdv-config.vim')
	-- refactor
	-- vim.cmd('packadd! vim-php-refactoring-toolbox')
end

if (api.nvim_get_option('loadplugins')) then
	if (vim.fn.has('packages')) then
		basePackages()
		developmentPackages()
		languageSpecificPackages()
	end
end

