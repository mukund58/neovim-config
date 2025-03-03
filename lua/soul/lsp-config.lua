local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- C/C++ setup
lspconfig.clangd.setup {
  capabilities = capabilities,
}

-- HTML setup
lspconfig.html.setup {
  capabilities = capabilities,
}

-- CSS setup
lspconfig.cssls.setup {
  capabilities = capabilities,
}

-- JavaScript/TypeScript setup (using ts_ls)
lspconfig.ts_ls.setup {
  cmd = { "typescript-language-server", "--stdio" }, -- Ensure the server is installed
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Optional: Disable formatting if using an external formatter like Prettier
    client.server_capabilities.documentFormattingProvider = false
  end,
}

-- PHP setup
lspconfig.intelephense.setup {
  capabilities = capabilities,
}

lspconfig.ast_grep.setup {
  capabilities = capabilities,
}
lspconfig.asm_lsp.setup {
  capabilities = capabilities,
}
