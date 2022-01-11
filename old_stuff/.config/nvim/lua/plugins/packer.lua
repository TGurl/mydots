local fn  = vim.fn

local install_path = fn.stdpath "data" ..  "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Startify
  --use 'mhinz/vim-startify'

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lualine/lualine.nvim"
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"

  -- kommmentary
  --use 'b3nj5m1n/kommentary'

  -- colorschemes
  use 'tanvirtin/monokai.nvim'
  use 'morhetz/gruvbox'
  use 'lifepillar/vim-gruvbox8'
  use 'lunarvim/darkplus.nvim'

  -- StatusLine
  --use { 'famiu/feline.nvim',
  --  requires = { 'kyazdani42/nvim-web-devicons' },
  --}

  -- Toggleterm
  use 'akinsho/toggleterm.nvim'

  use "nvim-telescope/telescope.nvim"
  
  -- Nvim-Tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }

  use 'goolord/alpha-nvim'
  use "folke/which-key.nvim"

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
  -- use 'xiyaowong/nvim-transparent'
  use 'norcalli/nvim-colorizer.lua'
  use "akinsho/bufferline.nvim"
  use 'Yggdroot/indentLine'
  use 'windwp/nvim-autopairs'
  use 'liuchengxu/vista.vim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
