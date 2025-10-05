for key, value in pairs({
  -- General
  swapfile = false,
  undofile = true,
  undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undo",
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
  smartindent = true,
  breakindent = true,

  -- Searching
  ignorecase = true,
  smartcase = true
}) do
  vim.opt[key] = value
end
