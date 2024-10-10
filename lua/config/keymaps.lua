-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.api.nvim_set_keymap("n", "<leader>dd", "diwi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dc", "diwi", { noremap = true, silent = true })

-- copy current buffer path with file
vim.api.nvim_set_keymap("n", "<leader>cpf", ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true })
-- copy current buffer path
vim.api.nvim_set_keymap("n", "<leader>cpp", ":let @+ = expand('%:h')<CR>", { noremap = true, silent = true })

-- live server
vim.keymap.set("n", "<leader>lt", function()
  require("live-server-nvim").toggle()
end)

vim.api.nvim_create_user_command("OpenConfig", function()
  -- Open nvim-tree
  vim.cmd("NvimTreeToggle")

  -- Open the init.lua file in the main window
  vim.cmd("edit ~/.config/nvim/lua/lazyvim/config/init.lua")
end, {})

vim.api.nvim_create_user_command("OpenPlugin", function()
  -- Open nvim-tree
  vim.cmd("NvimTreeToggle")

  -- Optionally navigate to a specific directory or file
  -- vim.cmd("edit ~/.config/nvim/plugins/") -- Uncomment if needed
end, {})
