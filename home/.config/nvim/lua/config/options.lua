for key, value in pairs({
  -- General
  swapfile = false,
  undofile = true,
  clipboard = "unnamedplus",
  termguicolors = true,
  showmode = false,

  -- Editor
  signcolumn = "yes",
  colorcolumn = "80",
  number = true,
  cursorline = true,
  scrolloff = 8,
  wrap = false,

  -- Indenting
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  breakindent = true,

  -- Searching
  ignorecase = true,
  smartcase = true
}) do
  vim.opt[key] = value
end
