vim.g.mapleader=" "
vim.keymap.set("n","<leader>e",vim.cmd.Ex)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- LSP Keybindings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
-- vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, { desc = "Format document" })
vim.api.nvim_set_keymap('n', '<leader>ct', ':!clang-tidy %<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session" })

-- OLD Keymap (relies only on the active LSP server)
-- vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, { desc = "Format document" })

-- NEW Keymap (uses conform.nvim, which handles external formatters like Prettier)
vim.api.nvim_create_user_command("FmtJava", function()
  local file = vim.api.nvim_buf_get_name(0)
  vim.cmd("write")
  os.execute("google-java-format -i " .. file)
  vim.cmd("edit!")
end, { desc = "Format current Java file" })

