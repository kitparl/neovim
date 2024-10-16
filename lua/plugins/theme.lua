-- return {
-- -- add gruvbox
-- { "ellisonleao/gruvbox.nvim" },
--
-- -- Configure LazyVim to load gruvbox
-- {
--   "LazyVim/LazyVim",
--   opts = {
--     colorscheme = "gruvbox",
--   },
-- },
-- {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = { style = "storm" },
-- },
-- }

return {
  { "folke/tokyonight.nvim", enabled = false },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "dawn",
      styles = {
        bold = true,
        italic = true,
      },
      highlight_groups = {
        -- Much darker text colors
        ["@text"] = { fg = "#2a273f" }, -- very dark purple-grey
        Normal = { fg = "#2a273f" }, -- very dark main text
        Comment = { fg = "#484458" }, -- darker comments
        NonText = { fg = "#484458" }, -- darker non-text

        -- Darker code elements
        ["@variable"] = { fg = "#164e63" }, -- very dark cyan
        ["@function"] = { fg = "#164e63" }, -- very dark cyan for functions
        ["@keyword"] = { fg = "#1e293b" }, -- very dark blue-grey
        ["@string"] = { fg = "#2a273f" }, -- very dark for strings
        ["@parameter"] = { fg = "#1e293b" }, -- very dark for parameters
        ["@type"] = { fg = "#164e63" }, -- very dark for types
        ["@operator"] = { fg = "#2a273f" }, -- very dark for operators

        -- UI elements
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
      },
    },
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
