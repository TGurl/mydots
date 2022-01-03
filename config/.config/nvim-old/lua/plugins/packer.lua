-------------------------------------------------------------
-- Plugin Manager configuration file
-------------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local cmd = vim.cmd

cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
-- for package info see: init.lua (Lua modules)
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Startify
  use 'mhinz/vim-startify'

  -- kommmentary
  use 'b3nj5m1n/kommentary'

  -- colorschemes
  use 'tanvirtin/monokai.nvim'
  use 'morhetz/gruvbox'
  use 'lifepillar/vim-gruvbox8'

  -- StatusLine
  use { 'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Nvim-Tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- Autocompletion
  use 'neovim/nvim-lspconfig'
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Tools and Utils
  use 'xiyaowong/nvim-transparent'
  use 'norcalli/nvim-colorizer.lua'
  use 'Yggdroot/indentLine'
  use 'windwp/nvim-autopairs'
  use 'liuchengxu/vista.vim'
  use 'nvim-treesitter/nvim-treesitter'
end)
