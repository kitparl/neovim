return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = true },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },

  -- Add rainbow indent highlighting
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  -- Add mini.indentscope animated indent lines
  {
    "echasnovski/mini.indentscope",
    event = "LazyFile",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        animation = function(next, total)
          return math.floor(next * total)
        end,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Custom highlights for indent-blankline
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("tokyonight").setup({
          on_highlights = function(hl, c)
            -- Customize indent guide colors
            hl.IndentBlanklineChar = { fg = c.dark3 }
            hl.IndentBlanklineContextChar = { fg = c.blue }

            -- Rainbow delimiter colors
            hl.RainbowDelimiterRed = { fg = c.red }
            hl.RainbowDelimiterYellow = { fg = c.yellow }
            hl.RainbowDelimiterBlue = { fg = c.blue }
            hl.RainbowDelimiterOrange = { fg = c.orange }
            hl.RainbowDelimiterGreen = { fg = c.green }
            hl.RainbowDelimiterViolet = { fg = c.purple }
            hl.RainbowDelimiterCyan = { fg = c.cyan }
          end,
        })
      end,
    },
  },
}
