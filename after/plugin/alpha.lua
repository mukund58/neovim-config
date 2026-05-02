local ok, alpha = pcall(require, "alpha")
if not ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}
dashboard.section.header.opts.hl = "Statement"


dashboard.section.buttons.val = {
  dashboard.button("f", "Find files", ":Telescope find_files<CR>"),
  dashboard.button("p", "Git files", ":Telescope git_files<CR>"),
  dashboard.button("r", "Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("g", "Grep (prompt)", ":Telescope grep_string<CR>"),
  dashboard.button("e", "Explorer", ":Ex<CR>"),
  dashboard.button("s", "Restore session", ":lua require('persistence').load()<CR>"),
  dashboard.button("u", "Update plugins", ":PackerSync<CR>"),
  dashboard.button("q", "Quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "Key bindings",
  "  Space pf  Find files",
  "  Space ps  Grep prompt",
  "  C-p       Git files",
  "  Space e   File explorer",
  "  Space a   Harpoon add",
  "  Space as  Harpoon menu",
  "  Space u   Undotree",
  "  Space qs  Restore session",
  "  Space fm  Format (Conform)",
  "  gd / K / gr  LSP definition, hover, references",
  "  Space rn / Space ca  LSP rename, code action",
  "  Space db  Open dashboard",
}

alpha.setup(dashboard.config)

vim.keymap.set("n", "<leader>db", "<cmd>Alpha<CR>", { desc = "Open Dashboard" })
