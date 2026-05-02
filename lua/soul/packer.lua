vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- UI & Colors
  use { 'rose-pine/neovim', as = 'rose-pine' }
  vim.cmd('colorscheme rose-pine')

  -- Syntax & Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Tools
  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'vim-syntastic/syntastic'
  use 'brianhuster/live-preview.nvim'
  use 'emakman/nvim-latex-previewer'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'gbrlsnchs/telescope-lsp-handlers.nvim'

  -- LSP & Autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'garymjr/nvim-snippets'
  use 'rafamadriz/friendly-snippets'
  use 'mfussenegger/nvim-jdtls'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvim-lua/lsp-status.nvim'

  -- Formatting
  use {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  }

  -- Auto-save
  use {
    'pocco81/auto-save.nvim',
    config = function()
      require("auto-save").setup {}
    end,
  }

  -- TODO comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Persistence
  use {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  }

  -- Flutter/Dart
  use { 'dart-lang/dart-vim-plugin' }
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Misc
  use "github/copilot.vim"
  use {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end,
  }
end)
