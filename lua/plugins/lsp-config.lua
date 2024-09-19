-- List of server that can are not mapped to mason-lspconfig ans should be installed manually
-- debugpy
-- mypy
-- black

local servers = {
    -- tsserver = {
    --       init_options = {
    --         plugins = {
    --           {
    --             name = "@vue/typescript-plugin",
    --             location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
    --             languages = {"javascript", "typescript", "vue"},
    --           },
    --         },
    --       },
    --       filetypes = {
    --         "javascript",
    --         "typescript",
    --         "vue",
    --       },
    -- },
    -- volar = {
    --     filetypes = {
    --         "vue",
    --         "typescript",
    --     },
    -- },
    --     pyright = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" }
            }
        },
    },
    grammarly = {
        filetypes = { "md", "tex" },

    },
    -- ltex = {
    --     filetypes = { "tex", "markdown" },
    --     ltex = {
    --         language = "en",
    --         -- additionalRules = {
    --         --     languageModel = "~/models/ngrams/",
    --         -- },
    --     },
    -- },
    pyright = {},

}


-- With LspAttach autocm you do not need to specify and
-- "attach" local function for the setup_handlers
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>. Not using it because autocompletion is way better
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
        end
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')
        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- replace the command below to trouble xx
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = ev.buf })
        -- the mapping below allows to check the arguments of the function while editing it
        vim.keymap.set('i', '<C-j>', function() vim.lsp.buf.signature_help() end, { buffer = ev.buf })
        -- vim formater
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, { buffer = ev.buf })
    end,
})


--local attach = function(_, bufnr)
--    print("Lsp Attached.")
--  -- NOTE: Remember that lua is a real programming language, and as such it is possible
--  -- to define small helper and utility functions so you don't have to repeat yourself
--  -- many times.
--  --
--  -- In this case, we create a function that lets us more easily define mappings specific
--  -- for LSP related items. It sets the mode, buffer and description for us each time.
--  local nmap = function(keys, func, desc)
--    if desc then
--      desc = 'LSP: ' .. desc
--    end

--    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--  end

--  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--  -- See `:help K` for why this keymap
--  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--  -- Lesser used LSP functionality
--  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--  nmap('<leader>wl', function()
--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  end, '[W]orkspace [L]ist Folders')
--  -- Create a command `:Format` local to the LSP buffer
--  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--    vim.lsp.buf.format()
--  end, { desc = 'Format current buffer with LSP' })
--  local opts = {buffer = bufnr, remap = false}
--  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

--end


return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'hrsh7th/cmp-nvim-lsp',
    },

    config = function()
        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        require'lspconfig'.volar.setup{
            init_options = {
                typescript = {
                    tsdk = '/home/ruda/.nvm/versions/node/v18.16.1/lib/node_modules/typescript/lib'
                    -- Alternative location if installed as root:
                    -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
                }
            },
            filetypes = {
                "vue",
            },
        }
        require'lspconfig'.ltex.setup{
            cmd = { "ltex-ls" },
            filetypes = { "tex", "markdown" },
            languages = {"en-US"}
            -- add the path to the ltex-ls binary

        }

        require'lspconfig'.tsserver.setup{
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/home/ruda/.nvm/versions/node/v18.16.1/lib/node_modules/@vue/typescript-plugin",
                languages = {"javascript", "typescript", "vue"},
              },
            },
          },
          filetypes = {
            "javascript",
            "typescript",
            "vue",
          },
        }



        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    -- on_attach = attach, -- Defined on LspAttach
                    capabilities = capabilities,
                    -- if server_name is in server, set the setting
                    -- if not, set the default setting
                    settings = servers[server_name] or {}
                }
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
             -- ["rust_analyzer"] = function ()
            --     require("rust-tools").setup {}
            -- end
         
        }
    end
}
