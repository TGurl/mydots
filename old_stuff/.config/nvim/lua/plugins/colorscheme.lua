--local opt = vim.opt
--local g = vim.g
--local cmd = vim.cmd

--opt.termguicolors = true	-- enable 24-bit RGB colors
--g.gruvbox_italics = 1
--g.gruvbox_italicize_strings = 1
--g.gruvbox_filetype_hi_groups = 1
--g.gruvbox_plugin_hi_groups = 1
--cmd [[colorscheme darkplus]]
-- cmd [[colorscheme gruvbox8]]
--cmd [[colorscheme gruvbox]]
--cmd [[colorscheme monokai]]

vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
