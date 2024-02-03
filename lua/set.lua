vim.g.mapleader = " "
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- vim.opt.cindent = {true, cinkeys = {'-','=', '0', '#'}}
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.g.conceallevel = 0
vim.g.concealcursor = 0
-- vertical split to the right
vim.opt.splitright = true
vim.opt.splitbelow = true
-- undotree
vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.wrap = false
vim.g.termguicolors = true

-- opens files from netrw in a previous window
-- vim.g.netrw_browse_split = 4
-- set width of 25% of current window width
-- vim.g.netrw_winsize = 30
-- tree-like listing of directories in netrw
-- vim.g.netrw_liststyle = 3
