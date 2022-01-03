--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim init file
  Version: 0.1 - 2021
  Maintainer: TransGirl
  Website: https://github.com/TGurl/neovim-lua

  Based upon the excelent work by BrainF*ck

--]]

-------------------------------------------------------------
-- Import Lua modules
-------------------------------------------------------------
require('settings')                   -- settings
require('keymaps')                    -- keymaps
require('plugins/packer')             -- plugin manager
require('plugins/nvim-tree')          -- file manager
require('plugins/feline')             -- statusline
require('plugins/startify')           -- startify
--require('plugins/kommentary')
require('plugins/nvim-cmp')           -- autocomplete
require('plugins/nvim-autopairs')     -- autopairs
require('plugins/nvim-colorizer')     -- colorizer
require('plugins/nvim-lspconfig')     -- LSP settings
require('plugins/vista')              -- tag viewer
require('plugins/nvim-treesitter')    -- tree-sitter interface
require('plugins/nvim-transparent')  -- transparency
