return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    explorer = {},
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
    indent = {
      animate = {
        enabled = false
      }
    },
    scroll = {},
    image = {
      enabled = false
    }
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
