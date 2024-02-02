-- work_index.lua
local M = {}
function M.WorkIndex()
    require('telescope.builtin').find_files({
        cwd = "~/.dotfiles/work",
        find_command = "index"
    })
end

return M
