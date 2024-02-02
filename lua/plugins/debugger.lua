return {

    {
        "theHamsta/nvim-dap-virtual-text",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap" },
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            vim.keymap.set('n', '<F9>', function() require('dap').continue() end)
            vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<F10>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
            vim.keymap.set('n', '<leader>dc', function() require('dapui').close() end)
            vim.keymap.set('n', '<leader>do', function() require('dapui').open() end)
            -- vim.api.nvim_create_user_command('Cdapui',function()
            --     require("dapui").close()
            -- end,{})

            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end

            -- dap.listeners.before.event_terminated['dapui_config'] = function()
            --     dapui.close()
            -- end
            -- dap.listeners.before.event_exited['dapui_config'] = function()
            --     dapui.close()
            -- end
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        filetypes = { "python" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3')
            -- vim.keymap.set('n', '<leader>pr', function() require('dap-python').test_method() end)
        end,
    }
}
