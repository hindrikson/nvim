return {
	"nvim-treesitter/nvim-treesitter",
	build="TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {"python", "lua", "javascript", "html", "markdown", "vim", "vimdoc"},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },

		})

	end


}
