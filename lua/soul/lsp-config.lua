-- lua/soul/lsp-config.lua
-- Modern LSP setup for Neovim 0.11+

-- Optional, if you use Mason
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "clangd", "html", "cssls", "ts_ls",
    "emmet_ls", "eslint", "intelephense",
    "ast_grep", "asm_lsp", "jdtls"
  },
}

-- Capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup all installed servers automatically
-- Change this:
-- require("mason-lspconfig").setup_handlers({
--   function(server_name)
--     ...
--   end,
-- })

-- To this (if on an older version):
require("mason-lspconfig").setup({
  ensure_installed = {
    -- ... your list here
  },
  handlers = {  -- Use the 'handlers' key inside the main setup
    -- This function will be the default handler
    ["*"] = function(server_name)
      local config = vim.lsp.configs[server_name] or {}
      -- ... rest of your configuration
      vim.lsp.start(config)
    end,
  },
})
-- lua/soul/lsp-config.lua (inside the setup_handlers function)

if server_name == "ts_ls" then
  -- This line is CRITICAL to prevent ts_ls from conflicting with Prettier
  config.on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end
  -- ... rest of ts_ls config
end
