return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- LSP Support
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',         -- Required
        'hrsh7th/cmp-nvim-lsp',     -- Required
        'hrsh7th/cmp-buffer',       -- Optional
        'hrsh7th/cmp-path',         -- Optional
        'saadparwaiz1/cmp_luasnip', -- Optional

        -- Snippets
        'L3MON4D3/LuaSnip',             -- Required
        'rafamadriz/friendly-snippets', -- Optional

        -- cmp formatting
        'onsails/lspkind.nvim'
    },
    config = function()
        local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lsp_capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), cmp_capabilities)

        vim.lsp.config('*', {
            capabilities = lsp_capabilities
        })

        vim.lsp.config.lua_ls = {
            settings = {
                runtime = {
                    version = 'LuaJIT',
                },
                Lua = {
                    diagnostics = {
                        globals = {'vim'}
                    }
                }
            }
        }

        require('mason').setup({ui = {border = 'rounded'}})
        require('mason-lspconfig').setup({
            automatic_enable = true
            -- ensure_installed = {'tsserver',},
        })

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local lspkind = require('lspkind')

        -- this is the function that loads the extra snippets to luasnip
        -- from rafamadriz/friendly-snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'luasnip', keyword_length = 2 },
                { name = 'buffer',  keyword_length = 3 },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            view = {
                docs = {
                    auto_open = true
                }
            },
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            -- formatting = lsp_zero.cmp_format({ details = true }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    menu = ({
                        buffer = '[Buffer]',
                        nvim_lsp = '[LSP]',
                        luasnip = '[LuaSnip]',
                        path = '[Path]',
                    })
                })
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-8),
                ['<C-d>'] = cmp.mapping.scroll_docs(8),
                ['<C-l>'] = function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end,
                ['<C-g>'] = function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end,
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })

    end,
}
