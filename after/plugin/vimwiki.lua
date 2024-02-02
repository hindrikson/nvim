vim.api.nvim_exec([[
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'
let g:vimtex_compiler_latexmk={'build_dir':'build'}
]], false)

vim.g.vimwiki_list = {
    {
        path = '~/all/git-repos/my-gitlab/thesis/bibliography',
        syntax = 'markdown',
        ext = '.md',
    },
    {
        path = '~/all/git-repos/my-gitlab/thesis/meetings',
        syntax = 'markdown',
        ext = '.md',
    },
    {
        path = '~/all/notes/',
        syntax = 'markdown',
        ext = '.md',
    },
}
vim.g.vimwiki_ext2syntax = {
    ['.md'] = 'markdown',
    ['.markdown'] = 'markdown',
    ['.mdown'] = 'markdown',
}

vim.g.vimwiki_global_ext = 0

vim.g.vimwiki_url_maxsave=0


