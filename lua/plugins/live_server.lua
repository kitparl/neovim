return {
  {
    "ngtuonghy/live-server-nvim",
    event = "VeryLazy",
    build = ":LiveServerInstall",
    config = function()
      require("live-server-nvim").setup({
        -- Add file types you want to serve
        file_types = { "html", "htm", "css", "javascript", "js", "typescript", "ts" },
        -- Additional configuration options
        port = 8080, -- The port to serve on
        host = "0.0.0.0", -- The host to serve on
        auto_open = true, -- Auto open browser when server starts
        no_css_inject = false, -- Disable CSS injection
        quiet = false, -- Suppress console output
      })
    end,
  },
}
