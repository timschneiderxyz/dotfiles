return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function()
    vim.keymap.set("n", "<space>f", function()
      require("telescope.builtin").find_files {
        hidden = true,
        follow = true
      }
    end)
  end
}
