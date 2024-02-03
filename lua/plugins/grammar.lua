return {
    "rhysd/vim-grammarous",
    ft = {"md", "tex"},
    level="picky",
    config = function()
        vim.cmd [[let g:grammarous#use_location_list = 1]]
    end
}
