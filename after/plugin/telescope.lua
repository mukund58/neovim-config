local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- Disable treesitter-based preview highlighting to avoid compatibility issues
-- between telescope and nvim-treesitter versions.
telescope.setup({
	defaults = {
		preview = {
			treesitter = false,
		},
	},
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', 'C-p', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

