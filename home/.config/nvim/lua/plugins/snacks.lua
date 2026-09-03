return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    dashboard = {},
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { ".git", ".DS_Store" }
        },
        files = {
          hidden = true,
          follow = true
        },
        grep = {
          hidden = true,
          follow = true
        }
      }
    },
    explorer = {},
    notifier = {},
    input = {},
    scroll = {},
    indent = {
      animate = {
        enabled = false
      }
    },
    scope = {},
    words = {},
    image = {
      enabled = false
    },
    bigfile = {},
    quickfile = {}
  },
  keys = {
    {
      "<leader>e",
      function()
        require("snacks").explorer()
      end,
      desc = "Toggle file explorer"
    },
    {
      "<leader>f",
      function()
        require("snacks").picker.files()
      end,
      desc = "Find files"
    },
    {
      "<leader>g",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Grep files"
    }
  }
}
