return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup{
                defaults = {
                    file_ignore_patterns = { "%.git/", "node_modules/" },
                    prompt_prefix = "> ",
                    sorting_strategy = "ascending",
                    -- path_display= {truncate = 3},
                    layout_config = {
                        prompt_position = "top",
                        height = 0.75,
                        width = 0.75,
                    },
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            -- ["<C-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end,
                            ["<C-[>"] = require('telescope.actions').close,

                            -- ["<C-h>"] = "which_key"
                        }
                    }
                    -- extentions here
                },
                pickers = {
                    find_files = {
                        prompt_prefix = "File: ",
                        path_display = {"truncate"},
                        sorting_strategy = "ascending",
                        hidden = true,
                        -- theme = "ivy",
                        -- layout_config = {
                        --     prompt_position = "top",
                        -- }
                    },
                    current_buffer_fuzzy_find = {
                        layout_config = {
                            preview_width = 0.75,
                            -- theme = "dropdown"
                        }
                    },
                    grep_string = {
                        layout_config = {
                            preview_width = 0.75,
                            -- theme = "dropdown"
                        }
                    },
                    live_grep  = {
                        prompt_prefix = "Grep: ",
                        sorting_strategy = "ascending",
                        -- theme = "dropdown",
                        layout_config = {
                            prompt_position = "top",
                        }
                    }
                },
                extensions = {
                    -- Your extension configuration goes here:
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    media_files = {
                        -- filetypes whitelist
                        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                        filetypes = {"png", "webp", "jpg", "jpeg"},
                        -- find command (defaults to `fd`)
                        find_cmd = "rg"
                    }
                    -- please take a look at the readme of the extension you want to configure
                },

            }
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            -- Search on buffer
            vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[S]earch current [B]uffer' })
            -- Search open buffers
            vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = '[S]earch [B]uffers' })
            -- find recently opened files
            vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

            -- for vim wiki directories
            vim.keymap.set('n', '<leader>dt', function()
                require('telescope.builtin').find_files({
                    cwd="~/all/repos/nvim",
                })
            end)
            vim.keymap.set('n', '<leader>wi', function()
                require('telescope.builtin').find_files({
                    cwd="~/.dotfiles/work",
                })
            end)
            vim.keymap.set('n', '<leader>pg', function()
                require('telescope.builtin').find_files({
                    cwd="~/.dotfiles/programs",
                })
            end)
            vim.keymap.set('n', '<leader>dl', function()
                require('telescope.builtin').find_files({
                    cwd="~/all/repos/github/deep_learning/notes",
                })
            end)
            -- configuration
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },


}

