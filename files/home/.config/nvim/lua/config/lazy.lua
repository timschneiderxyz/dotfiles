local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone lazy.nvim if it doesn't exist.
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { lazyrepo, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Put lazy.nvim at the start of the runtimepath.
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim.
require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  checker = { enabled = true }
})
