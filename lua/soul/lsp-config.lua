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

-- JavaScript/TypeScript setup
-- React / JavaScript / TypeScript LSP
lspconfig.ts_ls.setup {
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach = function(client, bufnr)
    -- If you want Prettier/ESLint for formatting, disable tsserver formatting:
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    -- Enables JSX/TSX support
    typescript = {
      format = {
        enable = true,
      },
    },
    javascript = {
      format = {
        enable = true,
      },
    },
  },
}

lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
}
lspconfig.eslint.setup {
  capabilities = capabilities,
}


-- PHP setup
lspconfig.intelephense.setup {
  capabilities = capabilities,
}

-- ast-grep
lspconfig.ast_grep.setup {
  capabilities = capabilities,
}

-- Assembly
lspconfig.asm_lsp.setup {
  capabilities = capabilities,
}

-- Java setup (jdtls)
lspconfig.jdtls.setup {
  capabilities = capabilities,
  cmd = { "jdtls" }, -- Ensure `jdtls` is installed and available in PATH
  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
}
