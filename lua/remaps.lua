local keymap = vim.keymap.set
local opts = { noremap = true, silent=true }

-- for increasing space
keymap('n', '<leader>=', ':vertical resize +5<cr>', { noremap = true, silent=true})
keymap('n', '<leader>-', ':vertical resize -5<cr>', { noremap = true, silent=true})
keymap('n', '<leader>t', '<c-w>=', { noremap = true, silent=true})
keymap('n', '<leader>b', '<c-w>-', { noremap = true, silent=true})
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
-- keeps the cursos centered while searching
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
keymap('n', 'J', 'mzJ`z', opts)
-- makes Y select the rest of the line, and not the whole line
keymap('n', 'Y', 'y$', opts)
--keeps the cursor all the middle while movving up and down
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])
-- what does Q do?
keymap("n", "Q", "<nop>")
-- next greatest remap ever : asbjornHaland
keymap({"n", "v"}, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
-- keeps selection
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- not sure what it does
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- for netrw and Lexplore
-- keymap('n', '<leader>m', ':wincmd v <bar> :Lexplore <bar> :vertical resize 30 <cr>' , opts)
-- vim.keymap.set("n", "<leader>m", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>m", ':vertical resize 30 | :Ex <cr>', opts)
-- keymap('n', '<leader>m', ':Explore <bar> :vertical resize 35 <cr>' , opts)

-- not using the one below
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- these are for quickfix list
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")



