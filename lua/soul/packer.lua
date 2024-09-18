vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use({ 'rose-pine/neovim', as = 'rose-pine' })

	vim.cmd('colorscheme rose-pine')
	use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use( 'nvim-treesitter/playground')
	use( 'ThePrimeagen/harpoon')
	use( 'mbbill/undotree')
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }

	}

	use {
		'VonHeikemen/lsp-zero.nvim',
			branch = 'v4.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			--Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

use ('neovim/nvim-lspconfig')
use ('nvim-lua/completion-nvim')
use ('anott03/nvim-lspinstall')		

end)
