local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3')
vim.keymap.set('n', '<leader>pr', function() require('dap-python').test_method() end)

-- require('nvim-dap-virtual-text').setup()
