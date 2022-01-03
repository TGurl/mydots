--------------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins
--------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

--------------------------------------------------------------
-- Neovim shortcuts
--------------------------------------------------------------

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- spellcheck
map('n', '<F11>', ':set spell!<CR>', default_opts)
map('i', '<F11>', '<C-O>:set spell!<CR>', default_opts)

-- move around splits usinc Ctrl + Shift + arrow keys
map('n', '<C-S-left>', '<C-w>h', default_opts)
map('n', '<C-S-up>', '<C-w>j', default_opts)
map('n', '<C-S-down>', '<C-w>k', default_opts)
map('n', '<C-S-right>', '<C-w>l', default_opts)

-- move around tabs usinc Ctrl + arrowkeys
map('n', '<C-left>', ':tabprev<CR>', default_opts)
map('n', '<C-right>', ':tabnext<CR>', default_opts)
map('i', '<C-left>', '<C-c>:tabprev<CR>', default_opts)
map('i', '<C-right>', '<C-c>:tabnext<CR>', default_opts)

-- open a new tab
map('n', '<C-t>', ':tabnew<CR>', default_opts)
map('i', '<C-t>', '<C-c>:tabnew<CR>', default_opts)

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':quitall<CR>', default_opts)

--------------------------------------------------------------
-- Applications & Plugins shortcuts
--------------------------------------------------------------
-- open terminal
map('n', '<leader>t', ':Term<CR>', {noremap = true})

-- nvim-tree
---- open/close
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)
---- refresh
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)
---- search file
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts)

-- Vista tag-viewer
---- open/close
map('n', '<C-m>', ':Vista!!<CR>', default_opts)


--------------------------------------------------------------
-- Disabled stuff
--------------------------------------------------------------

-- map Esc to kk
--map('i', 'kk', '<Esc>', {noremap = true})

-- don't use arrow keys
--map('', '<up>', '<nop>', {noremap = true})
--map('', '<down>', '<nop>', {noremap = true})
--map('', '<left>', '<nop>', {noremap = true})
--map('', '<right>', '<nop>', {noremap = true})

-- move around splits using Ctrl + {h,j,k,l}
--map('n', '<C-h>', '<C-w>h', default_opts)
--map('n', '<C-j>', '<C-w>j', default_opts)
--map('n', '<C-k>', '<C-w>k', default_opts)
--map('n', '<C-l>', '<C-w>l', default_opts)
