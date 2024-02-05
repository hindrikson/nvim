return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
        require("nvim-tree").setup {
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
            trash = {
                cmd = "trash-put",
            },
            git = {
                enable = false, 
             },
        }
        -- vim.g.nvim_tree_respect_buf_cwd = 1
		vim.keymap.set('n', '<leader>m', ':NvimTreeToggle<CR>', {})
        vim.keymap.set("n", "<leader>c", ":NvimTreeOpen %:p:h<cr>", {silent = true, noremap = true})
	end,
}

