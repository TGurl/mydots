--------------------------------------------------------------
-- NeoVim Configuration file
--------------------------------------------------------------
-- Copyright 2021 TransGirl
-- If you do not support Transgender rights, you are not allowed
-- to use this file in any shape or form!


--------------------------------------------------------------
-- Aliases
--------------------------------------------------------------
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt


--------------------------------------------------------------
-- General
--------------------------------------------------------------
g.mapleader = ','		-- change leader to a comma
opt.mouse = 'a'			-- enable mouse support
opt.clipboard = 'unnamedplus'	-- c/p to system clipboard
opt.swapfile = false		-- don't use swapfile
opt.showmode = false

--------------------------------------------------------------
-- Neovim UI
--------------------------------------------------------------
opt.number = true		-- show line number
opt.showmatch = true		-- hightlight matching parenthesis
opt.foldmethod = 'marker'	-- enable folding (def: 'foldmarker')
opt.colorcolumn = ''		-- line length marker at 80 columns
opt.splitright = true		-- vertical split to the right
opt.splitbelow = true		-- horizontal split to the bottom
opt.ignorecase = true		-- ignore case letter on search
opt.smartcase = true		-- ignore lowercase for the whole pattern
opt.linebreak = true		-- wrap on word boundary

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
	augroup YankHighLight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
	augroup end
]], false)

--------------------------------------------------------------
-- Memory, CPU
--------------------------------------------------------------
opt.hidden = true	-- enable background buffers
opt.history = 100	-- remember n lines in history
opt.lazyredraw = true	-- faster scrolling
opt.synmaxcol = 240	-- max column for syntax highlight

--------------------------------------------------------------
-- Colorscheme
--------------------------------------------------------------
opt.termguicolors = true	-- enable 24-bit RGB colors
g.gruvbox_italics = 1
g.gruvbox_italicize_strings = 1
g.gruvbox_filetype_hi_groups = 1
g.gruvbox_plugin_hi_groups = 1
cmd [[colorscheme gruvbox8]]
--cmd [[colorscheme gruvbox]]
--cmd [[colorscheme monokai]]

--------------------------------------------------------------
-- Spellcheck
--------------------------------------------------------------
cmd[[set spelllang=en]]
cmd[[set spellsuggest=best,9]]
cmd[[set spellfile=~/.vim/en.utf-8.add]]

--------------------------------------------------------------
-- Tabs, indent
--------------------------------------------------------------
opt.expandtab = true		-- use spaces instead of tabs
opt.shiftwidth = 4		-- shift 4 spaces when tab
opt.tabstop = 4			-- 1 tab = 4 spaces
opt.smartindent = true		-- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
cmd [[
  autocmd FileType text,markdown,javascript setlocal cc=0
  autocmd FileType html,xhtml setlocal cc=0
  autocmd FileType yaml,json setlocal cc=0
]]

-- 2 spaces for selected filetypes
cmd [[
	autocmd FileType html,css setlocal shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- IntentLine
--g.indentLine_setColors = 0	-- set indentLine color
g.indentLine_char = ' '		-- set indentLine character
g.gruvbox_transp_bg = 1         -- set transparent bg

-- disable IndentLine for markdown files (avoid concealing)
-- and set max textwidth to 80 characters
cmd [[
  autocmd FileType markdown let g:indentLine_enabled=0
]]
exec([[
  augroup WrapLinesMarkdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  augroup END
]], false)

--------------------------------------------------------------
-- Autocompletion
--------------------------------------------------------------
opt.completeopt = 'menuone,noselect,noinsert'

--------------------------------------------------------------
-- Terminal
--------------------------------------------------------------
-- open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
---- enter insert mod when switching to terminal
---- close terminal buffer on process exit
cmd [[
	autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
	autocmd TermOpen * startinsert
	autocmd BufLeave term://* stopinsert
]]

--------------------------------------------------------------
-- Startup
--------------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end
