-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.modifiable = true
vim.g["diagnostics_active"] = true
function Toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end

vim.keymap.set(
  "n",
  "<leader>xd",
  Toggle_diagnostics,
  { noremap = true, silent = true, desc = "Toggle vim diagnostics" }
)
