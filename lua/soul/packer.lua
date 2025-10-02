vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
 	use 'wbthomason/packer.nvim'
	use  'emakman/nvim-latex-previewer'
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	vim.cmd('colorscheme rose-pine')
	use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use( 'nvim-treesitter/playground')
	use( 'ThePrimeagen/harpoon')
	use( 'mbbill/undotree')
	use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'neovim/nvim-lspconfig'         -- LSP support
	use 'hrsh7th/nvim-cmp'              -- Autocompletion framework
	use 'hrsh7th/cmp-nvim-lsp'          -- LSP source for nvim-cmp
	use 'hrsh7th/cmp-buffer'            -- Buffer completions
	use 'hrsh7th/cmp-path'              -- Path completions
	use 'L3MON4D3/LuaSnip'              -- Snippets
	use "hrsh7th/cmp-cmdline"            -- Command-line completions
	use 'saadparwaiz1/cmp_luasnip'      -- Snippet completions
	use 'gbrlsnchs/telescope-lsp-handlers.nvim'
	use 'nvim-lua/lsp-status.nvim'
	use 'williamboman/mason.nvim'
 	use 'williamboman/mason-lspconfig.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'pocco81/auto-save.nvim'
	use 'vim-syntastic/syntastic'
	use 'garymjr/nvim-snippets'
	use 'brianhuster/live-preview.nvim'
	use  "github/copilot.vim"
	use 'rafamadriz/friendly-snippets'
	use "mfussenegger/nvim-jdtls" -- Java extras (debugging, testing, etc.)
	use {
	  	'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	require("packer").startup(function()
  	use({
    		"stevearc/conform.nvim",
   		 config = function()
      		require("conform").setup()
	end,
		  })
		end)
	use {
		"folke/persistence.nvim",
  		event = "BufReadPre", -- lazy load
	  	module = "persistence",
	  	config = function()
	    	require("persistence").setup()
 	 end,
	}
	use { 'dart-lang/dart-vim-plugin' }
	use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'neovim/nvim-lspconfig' }
	use { 'hrsh7th/nvim-cmp' }

	use {
	  	"loctvl842/monokai-pro.nvim",
  		config = function()
    		require("monokai-pro").setup()
  end
}
end)
