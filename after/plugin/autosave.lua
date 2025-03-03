require("auto-save").setup({
  enabled = true,
  execution_message = {
    message = function() return "" end, -- No message on save
  },
  events = { "InsertLeave", "TextChanged" },
  conditions = {
    exists = true,
    filetype_is_not = {},
    modifiable = true
  }
})

