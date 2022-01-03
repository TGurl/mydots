-- available schemes
--        darkplus
--        onedarker
--        tokyonight
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent = "false"

vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
