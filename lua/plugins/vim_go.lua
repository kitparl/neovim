return {
  {
    "fatih/vim-go",
    build = ":GoUpdateBinaries", -- Optional: Automatically update Go binaries on install
    ft = { "go" }, -- Loads only when editing Go files
    config = function()
      -- Example vim-go specific configurations
      vim.g.go_fmt_command = "goimports" -- Use goimports for formatting
      vim.g.go_auto_type_info = 1 -- Enable type info on hover
      vim.g.go_def_mapping_enabled = 0 -- Disable default mappings if using your own
    end,
  },
}
