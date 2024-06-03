return { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent=true }
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup()

        require('mini.files').setup({
            windows = {
                width_focus = 50,
            },
            mappings = {
                close       = 'q',
                go_in       = 'l',
                go_in_plus  = 'L',
                go_out      = 'h',
                go_out_plus = 'H',
                reset       = '<BS>',
                reveal_cwd  = '@',
                show_help   = 'g?',
                synchronize = 'w',
                trim_left   = '<',
                trim_right  = '>',
            },

        })
        -- Function to get the real path of the file under the cursor in mini.files and copy it to the clipboard
        function CopyMiniFilesRealPath()
            local current_path = require('mini.files').get_fs_entry().path
            local real_path = vim.fn.resolve(current_path)
            vim.fn.setreg('+', real_path)
            print('Copied to clipboard: ' .. real_path)
        end
        --
        -- Function to open mini.files in the directory of the current file
        function OpenMiniFilesInCurrentDir()
            local current_file_dir = vim.fn.expand('%:p:h')
            require('mini.files').open(current_file_dir)
        end

        keymap('n', '-', ':lua MiniFiles.open()<cr>', opts)

        -- Create a command to use the function
        vim.api.nvim_create_user_command('CopyMiniFilesRealPath', CopyMiniFilesRealPath, {})
        vim.api.nvim_set_keymap('n', '<leader>rp', ':CopyMiniFilesRealPath<CR>', { noremap = true, silent = true })
        -- Create a command to use the function
        vim.api.nvim_create_user_command('MiniFilesInCurrentDir', OpenMiniFilesInCurrentDir, {})
        vim.api.nvim_set_keymap('n', 'c-', ':MiniFilesInCurrentDir<CR>', { noremap = true, silent = true })

        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        local statusline = require 'mini.statusline'
        statusline.setup()

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we disable the section for
        -- cursor information because line numbers are already enabled
        ---@diagnostic disable-next-line: duplicate-set-field
        -- statusline.section_location = function()
        --   return ''
        -- end

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end,
}



