return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "echasnovski/mini.icons" }
  },
  config = function()
    require("mini.icons").setup()
    require("mini.icons").mock_nvim_web_devicons()
    require("lualine").setup {
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" }
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {"filename"},
        lualine_x = {"diagnostics", "encoding", "filetype"},
        lualine_y = {},
        lualine_z = {"location"}
      }
    }
  end
}
