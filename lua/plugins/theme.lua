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
