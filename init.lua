-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("run_program_popup.run_program")

require("nvim-devdocs").setup({
  additional_docs = { "java" },
})
