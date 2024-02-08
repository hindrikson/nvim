return {
    "lervag/vimtex",
    config = function()

        local function is_wsl()
            local wsl_flag = vim.fn.glob('~/.wsl_flag')
            if wsl_flag == '' then
                -- for linux
                vim.g.vimtex_view_method = 'zathura' -- For linux
                print("Vimtex for Linux")
                return true
            else
                -- for windows
                vim.g.vimtex_view_general_viewer = 'sumatrapdf.sh' -- For windows
                vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
                print("Vimtex for Wsl")
            end
        end

        is_wsl()

        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            -- build_dir = 'build',
            -- callback = 1,
            -- continuous = 1,
            -- executable = 'latexmk',
            -- hooks = {},
            options = {
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
                '-auxdir=aux-directory',
                '-emulate-aux-dir',
                -- '-outdir=build',
                '-pdf',
            },
        }
        vim.g.vimtex_compiler_latexmk_engines = {
            _ = '-lualatex',
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
