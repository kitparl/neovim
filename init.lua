-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("nvim-devdocs").setup({
  additional_docs = { "java" },
})

require("autocommands")
