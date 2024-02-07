return {
    "ThePrimeagen/harpoon",

    config = function()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")

        vim.keymap.set("n", "<leader>hh", function()
            mark.add_file()
            print("File marked")
        end, {}
        )
        vim.keymap.set("n", "<leader>hd", ui.toggle_quick_menu)

        vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
    end
}
