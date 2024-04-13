return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',             -- Required
        'williamboman/mason.nvim',           -- Optional
        'williamboman/mason-lspconfig.nvim', -- Optional

        -- Autocompletion
        'hrsh7th/nvim-cmp',         -- Required
        'hrsh7th/cmp-nvim-lsp',     -- Required
        'hrsh7th/cmp-buffer',       -- Optional
        'hrsh7th/cmp-path',         -- Optional
        'saadparwaiz1/cmp_luasnip', -- Optional
        'hrsh7th/cmp-nvim-lua',     -- Optional

        -- Snippets
        'L3MON4D3/LuaSnip',             -- Required
        'rafamadriz/friendly-snippets', -- Optional
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.set_sign_icons({
            error = 'E',
            warn = 'W',
            hint = 'H',
            info = 'I'
        })

        --[[ lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
        }) ]]

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader>li", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "<leader>ln", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "<leader>lp", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.setloclist() end, opts)
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set({ "n", "x" }, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
            -- vim.keymap.set({ "n", "x" }, "=", function() vim.lsp.buf.format({ async = true }) end, opts)
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
            -- ensure_installed = {'tsserver',},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- this is the function that loads the extra snippets to luasnip
        -- from rafamadriz/friendly-snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'luasnip', keyword_length = 2 },
                { name = 'buffer',  keyword_length = 3 },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            formatting = lsp_zero.cmp_format({ details = true }),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-l>'] = function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end,
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })

        vim.diagnostic.config({ virtual_text = true })
    end,
}
