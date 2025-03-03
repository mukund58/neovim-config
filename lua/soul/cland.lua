require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  cmd = { "clangd" },
})
