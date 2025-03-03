vim.g.mapleader=" "
vim.keymap.set("n","<leader>e",vim.cmd.Ex)

-- LSP Keybindings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, { desc = "Format document" })
vim.api.nvim_set_keymap('n', '<leader>ct', ':!clang-tidy %<CR>', { noremap = true, silent = true })

