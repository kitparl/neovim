-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.title = true
vim.opt.titlestring = "Neovim"

require("nvim-devdocs").setup({
  additional_docs = { "java" },
})

require("autocommands")
