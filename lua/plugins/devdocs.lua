return {
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Remove the previewer_cmd and cmd_args options
    },
    cmd = {
      "DevdocsOpen",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsFetch",
      "DevdocsUpdateAll",
    },
    keys = {
      { "<leader>do", "<cmd>DevdocsOpen<cr>", desc = "Open Devdocs" },
      { "<leader>di", "<cmd>DevdocsInstall<cr>", desc = "Install Devdocs" },
    },
    config = function(_, opts)
      require("nvim-devdocs").setup(opts)
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyLoad",
        callback = function()
          if vim.bo.filetype == "nvim-devdocs" then
            vim.cmd("DevdocsFetch")
          end
        end,
      })
    end,
  },
}
