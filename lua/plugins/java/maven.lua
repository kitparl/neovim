-- Keymap to run 'mvn clean install' in a terminal buffer
-- vim.keymap.set(
--   "n",
--   "<leader>mc",
--   ":lua require('my_maven').run('clean install')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>mt",
--   ":lua require('my_maven').run('test')<CR>",
--   { noremap = true, silent = true, desc = "Maven Test" }
-- )
-- vim.keymap.set("n", "<leader>mr", ":lua require('my_maven').run('exec:java')<CR>", { noremap = true, silent = true })
-- vim.keymap.set(
--   "n",
--   "<leader>md",
--   ":lua require('my_maven').run('dependency:resolve')<CR>",
--   { noremap = true, silent = true }
-- )
--
-- -- Lua function to run Maven commands in a terminal buffer
-- vim.cmd([[
-- function! RunMavenCommand(cmd)
--   " Open a new terminal buffer
--   :vsplit term://mvn a:cmd
-- endfunction
-- ]])