--- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- use 'ThePrimeagen/vim-be-good'
    use 'tpope/vim-commentary'
    -- use 'luk400/vim-jukit'
    use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
    use "ThePrimeagen/harpoon"
    use "mbbill/undotree"
    use 'tpope/vim-fugitive'
    use 'nvim-tree/nvim-web-devicons'
    use 'vimwiki/vimwiki'
    use {'lervag/vimtex'}
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {'ojroques/nvim-osc52'}
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'BurntSushi/ripgrep'},
        }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use 'nvim-telescope/telescope-media-files.nvim'

    -- dap
    use {"theHamsta/nvim-dap-virtual-text"}
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use "mfussenegger/nvim-dap"
    use {"mfussenegger/nvim-dap-python", filetypes = {"python"}, requires = {"mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui"}}


    use {'jose-elias-alvarez/null-ls.nvim', filetypes = {'python'}}

    use {"rest-nvim/rest.nvim", requires = { "nvim-lua/plenary.nvim" }}
    use {"christoomey/vim-tmux-navigator", lazy=false}
    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional
    --     },
    -- }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
            {'folke/neodev.nvim'},
            {'j-hui/fidget.nvim'},
        }
    }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- use({
    --     'folke/tokyonight.nvim',
    --     as = 'tokyonight',
    --     config = function()
    --         vim.cmd('colorscheme tokyonight-night')
    --     end
    -- })

    -- use({
    --     'catppuccin/nvim',
    --     as = 'catppuccin',
    --     config = function()
    --         vim.cmd('colorscheme catppuccin')
    --     end
    -- })

    -- use { "catppuccin/nvim", as = "catppuccin" }

    -- use "zbirenbaum/copilot"
	use {
		"zbirenbaum/copilot.lua",
		-- cmd = "Copilot",
		-- config = function()
		-- 	require("copilot")
		-- end,
	}

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- use {
    --   "zbirenbaum/copilot.lua",
    --   cmd = "Copilot",
    --   event = "InsertEnter",
    --   config = function()
    -- 	require("copilot").setup({})
    --   end,
    -- }



    -- Packer
    -- use({
    --   "jackMort/ChatGPT.nvim",
    --     config = function()
    --       require("chatgpt").setup({
    --           api_key_cmd = "echo OPENAI_API_KEY",
    --       })
    --     end,
    --     requires = {
    --       "MunifTanjim/nui.nvim",
    --       "nvim-lua/plenary.nvim",
    --       "nvim-telescope/telescope.nvim"
    --     }
    -- })

    -- use "brymer-meneses/grammar-guard.nvim"
    -- use {
    -- 	'chipsenkbeil/distant.nvim',
    -- 	branch = 'v0.3',
    -- 	config = function()
    -- 		require('distant'):setup()
    -- 	end
    -- }
end)
