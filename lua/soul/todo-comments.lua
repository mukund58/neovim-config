require("todo-comments").setup {
  signs = true, -- show icons in the gutter
  sign_priority = 8,
  keywords = {
    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "ISSUE" } },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
    PERF = { icon = " ", color = "hint", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  highlight = {
    multiline = true,
    before = "", -- "fg", "bg", or empty
    keyword = "wide", -- how to highlight the keyword
    after = "fg", -- style for after text
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern for matching
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
  },
}

