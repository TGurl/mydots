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
--require('settings')                   -- settings
require('plugins/options')
require('plugins/colorscheme')
require('plugins/keymaps')            -- keymaps
require('plugins/packer')             -- plugin manager
require('plugins/autocommands')
require('plugins/bufferline')
require('plugins/indentline')
require('plugins/nvim-tree')          -- file manager
--require('plugins/feline')             -- statusline
require('plugins/lualine')
--require('plugins/startify')           -- startify
--require('plugins/kommentary')
require('plugins/alpha')
require('plugins/telescope')
require('plugins/nvim-cmp')           -- autocomplete
require('plugins/nvim-autopairs')     -- autopairs
require('plugins/nvim-colorizer')     -- colorizer
require('plugins/nvim-lspconfig')     -- LSP settings
require('plugins/vista')              -- tag viewer
require('plugins/nvim-treesitter')    -- tree-sitter interface
require('plugins/toggleterm')
--require('plugins/nvim-transparent')  -- transparency
require('plugins/whichkey')
