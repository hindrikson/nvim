return {
    "lervag/vimtex",
    config = function()
        -- for linux
        vim.g.vimtex_view_method = 'zathura' -- SumatraPDF for windows
        -- for windows
        -- vim.g.vimtex_view_general_viewer = '~/.local/bin/sumatrapdf.sh' -- SumatraPDF for windows
        -- vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'


        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            -- build_dir = 'build',
            -- callback = 1,
            -- continuous = 1,
            -- executable = 'latexmk',
            -- hooks = {},
            options = {
                -- '-verbose',
                -- '-file-line-error',
                -- '-synctex=1',
                -- '-interaction=nonstopmode',
                '-auxdir=aux-directory',
                '-emulate-aux-dir',
                -- '-outdir=build',
                '-pdf',
            },
        }
        vim.g.vimtex_compiler_latexmk_engines = {
            _ = '-xelatex',
            -- pdflatex = '-pdf',
            lualatex = '-lualatex',
            xelatex = '-xelatex',
        }
        -- vim.g.vimtex_compiler_latexrun = {
        --     build_dir = 'build',
        --     callback = 1,
        --     continuous = 1,
        --     executable = 'latexrun',
        --     hooks = {},
        --     options = {
        --         '--verbose',
        --         '--latex-args="-file-line-error -synctex=1 -interaction=nonstopmode"',
        --         '--latex-args="-outdir=build"',
        --         '--latex-args="-pdf"',
        --     },
        -- }
        -- vim.g.vimtex_compiler_latexrun_engines = {
        --     _ = '',
        --     pdflatex = '',
        --     lualatex = '',
        --     xelatex = '',
        -- }
        -- vim.g.vimtex_compiler_latexrun_opts = {
        --     _ = '',
        --     pdflatex = '',
        --     lualatex = '',
        --     xelatex = '',
        -- }
        -- vim.g.vimtex_compiler_latexrun_progname = {
        --     _ = 'nvr',
        --     pdflatex = 'nvr',
        --     lualatex = 'nvr',
        --     xelatex = 'nvr',
        -- }
    end
}
