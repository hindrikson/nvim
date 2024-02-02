-- vim cursor in block and blinking white
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

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
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.g.conceallevel = 0
vim.g.concealcursor = 0

-- vertical split to the right
vim.opt.splitright = true
-- undotree
vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.splitbelow = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.g.mapleader = " "

-- opens files from netrw in a previous window
-- vim.g.netrw_browse_split = 4
-- set width of 25% of current window width
-- vim.g.netrw_winsize = 30
-- tree-like listing of directories in netrw
vim.g.netrw_liststyle = 3

vim.opt.updatetime = 50

vim.g.termguicolors = true
-- vim.g.t_Co = true

-- for using jukit
vim.g.jukit_terminal = "nvimterm" -- tmux, nvimterm, kitty, alacritty, iterm2, terminal
vim.g.jukit_mappings_ext_enabled = { 'py', 'ipynb' }

vim.g.vimwiki_list = {
  {
    path = '~/.dotfiles/work/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/.dotfiles/programs/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '/mnt/c/Users/rhindrikson/iee/myRepos/gitlab/thesis2/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/all/repos/github/deep_learning/notes/',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/all/repos/github/deep_learning/references/',
    syntax = 'markdown',
    ext = '.md',
  },
  -- Add more entries for additional directories if needed
}

-- -- for vimtex
-- vim.api.nvim_exec([[
-- let g:vimtex_view_method='zathura'
-- let g:vimtex_compiler_method='latexmk'
-- let g:vimtex_compiler_latexmk={'build_dir':'build'}
-- ]], false)

vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  build_dir = 'build',
  options = {
    '-xelatex',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
    '-shell-escape',
    '-pdf',
    '-auxdir=aux-directory',
  },
}

