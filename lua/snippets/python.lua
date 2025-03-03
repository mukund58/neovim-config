local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Define a snippet with the trigger "def"
  s("def", {
    t("def "), i(1, "function_name"), t("("), i(2, "args"), t("):"),
    t({"", "    "}), i(3, "pass"), -- `pass` as the default body
  }),
}

