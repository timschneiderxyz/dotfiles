-- General
vim.api.nvim_exec('language en_US', false)
vim.api.nvim_exec('autocmd VimLeave * set guicursor=a:ver25-blinkon1', false)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv('XDG_CACHE_HOME') .. '/nvim/undo'
vim.opt.clipboard = 'unnamedplus'

-- Editor
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.colorcolumn = '80'
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indenting
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
