return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- Set the default language to Java
      lang = "java",

      -- Set other configuration options as desired
      -- Refer to the plugin's documentation for available options
      -- Example: enable the leaderboard feature
      enable_leaderboard = true,

      -- Example: customize the problem explorer
      problem_explorer = {
        show_tags = true,
        show_companies = true,
      },
    },
  },
}
