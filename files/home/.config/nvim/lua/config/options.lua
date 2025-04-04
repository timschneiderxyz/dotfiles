-- General
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undo"
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false

-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Editor
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indenting
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
