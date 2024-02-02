function TermOpen()
    local filename = vim.fn.expand("%")
    local cmd = "vs | :terminal python3 "..filename.. " -l"
    vim.cmd(cmd)
end

-- keymaps for executing python
-- in toggleterm.lua I am using another command with c-e
local opts = { noremap = true, silent=true }
-- vim.keymap.set('n', '<c-w>', ':w <bar> :wincmd j <bar> :bd!<bar>:lcd %:h<bar>:sv <bar> terminal python3 main.py -l<cr>', opts)
-- vim.keymap.set('n', '<c-e>', ':w <bar>:lcd %:h<bar>:sv <bar> terminal python3 main.py -l<cr>', opts)

function OpenT()
  -- Open a terminal window
  local terminal = vim.api.nvim_open_win(0, true, {
    relative = 'editor',
    row = 10,
    col = 10,
    height = 10,
    width = 80,
    style = 'minimal',
  })

  -- Switch to the terminal buffer
  vim.api.nvim_set_current_win(terminal)

  local condaenv = "conda activate dashenv"

  -- Execute the command in the terminal
  vim.api.nvim_input(':terminal ' ..condaenv.. '<CR>')
end

