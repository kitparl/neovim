vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float({ focusable = true })
end)
