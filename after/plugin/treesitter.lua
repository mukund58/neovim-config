local ok_install, ts_install = pcall(require, "nvim-treesitter.install")
if ok_install then
  ts_install.prefer_git = true
end

local ok_configs, ts_configs = pcall(require, "nvim-treesitter.configs")
if not ok_configs then
  return
end

ts_configs.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "markdown", "markdown_inline", "javascript", "rust", "typescript","php" , "html", "css", "json", "bash", "python", "go", "java", "sql", "dockerfile" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
        disable = {}, -- adjust to the language(s) failing
    additional_vim_regex_highlighting = true,
  },
}
