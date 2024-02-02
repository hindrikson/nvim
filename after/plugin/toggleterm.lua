require("toggleterm").setup({
    size = 20,
    -- size = 13, for horizontal
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes= {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit=false, -- otherwise it won't show error messages
    shell= vim.o.shell,
    float_opts = {
        border = "curved",
        winblend=8,
        highlights= {
            border = "Normal",
            background="Normal",
            },
    }
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<leader>h',[[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<leader>j',[[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<leader>k',[[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<leader>l',[[<Cmd>wincmd l<CR>]], opts)

end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


local function get_name()
  return vim.fn.expand('%:~:.')
end


local Terminal  = require('toggleterm.terminal').Terminal

function _pycmd2_toggle()
  -- change directory to the directory of the current file opened in the current buffer
  -- local dir = vim.fn.expand("%:p:h")
  -- get the full patch of the file in the current buffer
  -- local filename = vim.fn.expand("%:p")
  -- local filename = vim.fn.expand("%")
  -- get the just the file name withouch the path
  local filename = vim.fn.expand("%:t")
  -- local filename = vim.fn.expand("%:~:.")
  -- get the absolute path of the file in the current buffer
  -- change neovim current directory to the directory of the file in the current buffer
  vim.cmd(":cd %:h")
  user_options = vim.fn.input("Options: ")
  -- local cmd_string = "python3 "..filename.." "..user_options
  local cmd_string = "python3 "..filename.." "..user_options
  print(cmd_string)
  pycmd2 = Terminal:new({
      cmd = cmd_string,
      start_in_insert = false,
      count = 1,
  })

  pycmd2:toggle()
  -- change the directory back to where it was
  vim.cmd(":cd -")
end

vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>:w | lua _pycmd2_toggle()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>lua _pycmd2_toggle()<CR>", {noremap = true, silent = true})

local Terminal  = require('toggleterm.terminal').Terminal

function _vifm_toggle()
  vifmterm = Terminal:new({
      cmd = "vifm .",
      start_in_insert = true,
      close_on_exit=true,
      count = 10,
  })

  vifmterm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>lua _vifm_toggle()<CR>", {noremap = true, silent = true})

-- If I have lazygit installed
-- local lazygit = Terminal:new({
--   cmd = "lazygit",
--   dir = "git_dir",
--   direction = "float",
--   float_opts = {
--     border = "double",
--   },
--   -- function to run on opening the terminal
--   on_open = function(term)
--     vim.cmd("startinsert!")
--     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--   end,
--   -- function to run on closing the terminal
--   on_close = function(term)
--     vim.cmd("startinsert!")
--   end,
-- })

-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

