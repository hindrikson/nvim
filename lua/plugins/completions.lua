return {
    {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua'

    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        }
    },

    { "hrsh7th/nvim-cmp",
        config = function()
            -- Set up nvim-cmp.
            local cmp = require'cmp'
            require("luasnip/loaders/from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "buffer", keyword_length = 3 },
                    { name = "gh_issues" },
                    -- Youtube: Could enable this only for lua, but nvim_lua handles that already.
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "luasnip" },
                    { name = "copilot", group_index = 2, keyword_length = 0 },

                }, {
                        { name = 'buffer' },
                    }),
                formatting = {
                    format = function(entry, vim_item)
                        -- load lspkind icons
                        -- vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            gh_issues = "[GH]",
                            copilot = "[Copilot]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sorting = {
                    priority_weight = 1.0,
                    comparators = {
                        -- compare.score_offset, -- not good at all
                        cmp.config.compare.locality,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
                        cmp.config.compare.offset,
                        cmp.config.compare.order,
                        -- compare.scopes, -- what?
                        -- compare.sort_text,
                        -- compare.exact,
                        -- compare.kind,
                        -- compare.length, -- useless 
                    },}
            })
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                window = { completion = cmp.config.window.bordered({ col_offset = 0 }) },
                formatting = { fields = { "abbr" } },
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                window = { completion = cmp.config.window.bordered({ col_offset = 0 }) },
                formatting = { fields = { "abbr" } },
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                        { name = "cmdline" },
                    }),
            })



            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
                capabilities = capabilities
            }
        end,
    },

}
