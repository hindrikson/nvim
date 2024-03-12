return {
    -- {"catppuccin/nvim",
    --     lazy = false,
    --     name = "catpuccin",
    --     priority = 1000,
    -- },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        filetypes = {"markdown"},
        config = function()
            vim.g.rose_pine_variant = "moon"
            vim.cmd.colorscheme "rose-pine-moon"
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme "tokyonight-night"
        end
    }


}
