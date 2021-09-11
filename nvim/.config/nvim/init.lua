line_length_max = 120
tab_width = 2

api = vim.api
fn = vim.fn
g = vim.g
opt = vim.opt

-- # LANGUAGE PROGRAMS
g.python_host_prog = 'python2'
g.python2_host_prog = 'python2'
g.python3_host_prog = 'python3'
g.ruby_host_prog = 'ruby'

-- # GENERAL
opt.autoread = true -- automatically watch for changes
opt.backspace = 'eol,start,indent'
opt.backup = false
opt.clipboard = 'unnamedplus' -- use system clipboard
opt.cmdheight = 2 -- command height
opt.cursorcolumn = true -- highlight cursor column
opt.cursorline = true -- highlight cursor line
opt.directory = opt.directory + fn.expand('~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp') -- swap file locations
opt.encoding = 'utf-8'
opt.errorbells = false -- no sound on errors
opt.guifont = 'FiraCode Nerd Font Mono Regular:h8'
opt.hidden = true -- hide unsaved files instead of forcing you to save/quit
opt.modelines = 5 -- read config from first 5 lines
opt.pastetoggle = '<leader>z'
opt.scrolloff = 5 -- keep cursor more vertically centered
opt.showtabline = 2
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = 'useopen,usetab,newtab' -- specify behavior for switching buffers
opt.tags = '.git/tags' -- ctags location
opt.timeoutlen = 500 -- keymap timeout
opt.undodir = fn.expand('~/.local/share/nvim/undo')
opt.undofile = true
opt.wildmode = 'longest,list,full' -- autocompletion

-- # CODING
opt.number = true -- show current line
opt.relativenumber = true  -- show relative line numbers
opt.colorcolumn = tostring(line_length_max) -- max line length guide
opt.foldmethod = 'expr' -- use expression for folding
opt.foldexpr = [[nvim_treesitter#foldexpr()]] -- use treesitter for code folding
opt.showmatch = true -- pair matching
opt.matchtime = 2 -- blink for 200 ms on match
opt.exrc = true -- allow project specific settings
opt.secure = true
vim['&t_8f'] = '<Esc>[38;2;%lu;%lu;%lum' -- 24 bit colors
vim['&t_8b'] = '<Esc>[38;2;%lu;%lu;%lum' -- 24 bit colors
opt.termguicolors = true -- 24 bit colors

-- # SEARCH
opt.hlsearch = true -- highlight matches
opt.incsearch = true -- highlight partial matches
opt.ignorecase = true
opt.magic = true -- regex
opt.smartcase = true
opt.wildignore = vim.o.wildignore .. "*/.git/*,*/tmp/*,*.swp" -- ignore

-- # WHITESPACE
opt.tabstop = tab_width
opt.softtabstop = tab_width
opt.shiftwidth = tab_width
opt.expandtab = false
opt.fileformats = 'unix,mac,dos'
opt.listchars = 'tab:¦ ,extends:»,precedes:«,nbsp:×,eol:¬,trail:·'
opt.autoindent = true
opt.smartindent = true

-- PACKAGES
if (vim.o.loadplugins) then
	if (fn.has('packages')) then
		require 'config.packages'
	end
end

function strip_trailing_whitespace_maybe()
	local excluded_filetypes = {
		markdown = 1
	}
	if 1 == excluded_filetypes[vim.bo.filetype] then
		return
	end

	vim.cmd [[%s/\s\+$//e]]
end

function retab_maybe()
	local excluded_filetypes = {
		yaml = 1
	}
	if 1 == excluded_filetypes[vim.bo.filetype] then
		return
	end

	vim.cmd [[:retab!]]
end

-- AUTOCMDS
if fn.has('autocmd') then
	vim.cmd [[autocmd BufWritePre * silent! lua retab_maybe()]]
	vim.cmd [[autocmd BufWritePre * silent! lua strip_trailing_whitespace_maybe()]]
	if fn.exists('##TextYankPost') then
		vim.cmd [[autocmd TextYankPost * silent! lua require"vim.highlight".on_yank("IncSearch", 200)]]
	end
end
