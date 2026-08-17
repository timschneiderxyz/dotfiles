return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  opts = {
    options = {
      theme = "auto",
      icons_enabled = true,
      section_separators = { left = "", right = "" },
      component_separators = { left = "|", right = "|" }
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "filename" },
      lualine_x = { "diagnostics", "encoding", "filetype" },
      lualine_y = {},
      lualine_z = { "location" }
    }
  }
}
