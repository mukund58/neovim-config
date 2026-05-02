local function is_dir(path)
  return path and vim.fn.isdirectory(path) == 1
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 1 and is_dir(vim.fn.argv(0)) then
      vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.argv(0)))
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "netrw" then
          vim.api.nvim_buf_delete(buf, { force = true })
        end
      end
      vim.cmd("Alpha")
      return
    end

    if vim.fn.argc() == 0 then
      vim.cmd("Alpha")
    end
  end,
})
