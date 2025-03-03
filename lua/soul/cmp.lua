-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })

vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    return "<Tab>"
  end
end, { expr = true, silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    return "<S-Tab>"
  end
end, { expr = true, silent = true })


cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept suggestion
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP suggestions
    { name = "luasnip" },  -- Snippets
  }, {
    { name = "buffer" },   -- Buffer suggestions
    { name = "path" },     -- Path suggestions
  }),
})

-- Setup LSP integration with nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

-- Example: Enable LSP for HTML
lspconfig.html.setup {
  capabilities = capabilities,
}

