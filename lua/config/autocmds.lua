-- Automatically Open Trouble Quickfix
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})
-- Test with something like `:silent grep vim %`
