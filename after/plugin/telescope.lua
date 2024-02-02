require('telescope').setup{
  defaults = {
      prompt_prefix = "> ",
      sorting_strategy = "ascending",
      -- path_display= {truncate = 3},
	  layout_config = {
		prompt_position = "top",
		height = 0.75,
		preview_width = 0.50,
		},
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end,

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
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('media_files')


-- ======================================================================
-- ======================================================================
-- old REMAPS 
-- local opts = { noremap = true }

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>dt', function()
-- 	builtin.find_files({
-- 		cwd="~/.dotfiles/.config/nvim",
-- 	})
-- end)

-- -- keymap('n', '<leader>/', ':Telescope current_buffer_fuzzy_find previewer=false<cr>', opts)
-- vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, opts)
-- vim.keymap.set('n', '<leader>a', builtin.grep_string, opts)

-- vim.keymap.set('n', '<leader>wd', ':Telescope find_files cwd=', opts)
-- ======================================================================
-- ======================================================================

-- new remaps
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- require('telescope').setup {
--   defaults = {
--     mappings = {
--       i = {
--         ['<C-u>'] = false,
--         ['<C-d>'] = false,
--       },
--     },
--   },
-- }

-- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(
    -- require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    -- } 
  )
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- Search on buffer
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[S]earch current [B]uffer' })
-- Search open buffers
vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })

vim.keymap.set('n', '<leader>dt', function()
	require('telescope.builtin').find_files({
		cwd="~/.dotfiles/.config/nvim",
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

