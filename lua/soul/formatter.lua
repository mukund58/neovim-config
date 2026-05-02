-- lua/soul/formatter.lua (or wherever you put your conform config)
local conform = require("conform")

conform.setup({
    -- Define the formatters to use for each filetype
    formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        -- Add any other filetypes you use with Prettier
    },

    -- Configuration for formatting on save
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Use LSP formatting if conform has no formatter for the filetype
        -- filter = function(bufnr)
        --     return vim.api.nvim_get_mode().mode ~= 'i' -- Example: Don't format while in insert mode
        -- end
    },
})

-- Optional: Create a global keymap to manually format the buffer
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
    conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format file or range (Conform)" })
