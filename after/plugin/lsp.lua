local lsp = require('lsp-zero').preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
})

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

--[[ lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        -- ['<C-l>'] = cmp.mapping.complete(),
        ['<C-l>'] = function()
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end,
    })
}) ]]

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
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
    }
})

--[[ lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
}) ]]

lsp.set_sign_icons({
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

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>li", function() vim.lsp.buf.hover() end, opts)
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
    -- vim.keymap.set({"n", "x"}, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
