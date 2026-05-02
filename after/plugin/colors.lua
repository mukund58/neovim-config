function ColorMyPencils(color)
            color = color or "monokai-pro"
            local ok = pcall(vim.cmd.colorscheme, color)
            if not ok then
                        pcall(vim.cmd.colorscheme, "rose-pine")
            end

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end
ColorMyPencils()

