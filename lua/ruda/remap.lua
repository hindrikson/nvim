vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent=true }

keymap('n', '<C-h>', ':wincmd h<cr>', opts)
keymap('n', '<C-j>', ':wincmd j<cr>', opts)
keymap('n', '<C-k>', ':wincmd k<cr>', opts)
keymap('n', '<C-l>', ':wincmd l<cr>', opts)


-- keymap('n', '<leader>h', ':wincmd h<cr>', opts)
-- keymap('n', '<leader>j', ':wincmd j<cr>', opts)
-- keymap('n', '<leader>k', ':wincmd k<cr>', opts)
-- keymap('n', '<leader>l', ':wincmd l<cr>', opts)


-- for undoTree
keymap('n', '<leader>u', ':UndotreeToggle<cr>', opts)

-- for increasing space
keymap('n', '<leader>=', ':vertical resize +5<cr>', { noremap = true, silent=true})
keymap('n', '<leader>-', ':vertical resize -5<cr>', { noremap = true, silent=true})
keymap('n', '<leader>t', '<c-w>=', { noremap = true, silent=true})
keymap('n', '<leader>b', '<c-w>-', { noremap = true, silent=true})

-- for netrw and Lexplore
-- keymap('n', '<leader>m', ':wincmd v <bar> :Lexplore <bar> :vertical resize 30 <cr>' , opts)
vim.keymap.set("n", "<leader>m", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>m", ':vertical resize 30 | :Ex <cr>', opts)
-- keymap('n', '<leader>m', ':Explore <bar> :vertical resize 35 <cr>' , opts)


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- what does Q do?
vim.keymap.set("n", "Q", "<nop>")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- keeps selection
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- keeps the cursos centered while searching
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
keymap('n', 'J', 'mzJ`z', opts)

-- makes Y select the rest of the line, and not the whole line
keymap('n', 'Y', 'y$', opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- not sure what it does
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- not using the one below
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- these are for quickfix list
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

