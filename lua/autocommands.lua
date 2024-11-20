-- autocommands.lua

-- Auto-run Maven commands on file save
-- vim.cmd([[
-- augroup AutoRunMaven
--     autocmd!
--     autocmd BufWritePost *.java execute 'lua require("run_program.maven_run").run("clean install")'
-- augroup END
-- ]])
