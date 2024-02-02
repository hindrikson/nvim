return {
    "vimwiki/vimwiki",
    config = function()
        vim.g.vimwiki_list = {
            {
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
            },
        }

        vim.g.vimwiki_ext2syntax = {
            ['.md'] = 'markdown',
            ['.markdown'] = 'markdown',
            ['.mdown'] = 'markdown',
        }

        vim.g.vimwiki_global_ext = 0

        vim.g.vimwiki_url_maxsave=0

        end
}
