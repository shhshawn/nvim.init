return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('nvim-tree').setup({})

            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
        end,
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function()
            require('oil').setup({
                default_file_explorer = false,
                columns = {
                    -- "permissions",
                    "mtime",
                    "size",
                    "icon",
                },
                delete_to_trash = true,
                use_default_keymaps = false,
                keymaps = {
                    ['<leader>o'] = { 'actions.close', mode = 'n' },
                    ['g?'] = { 'actions.show_help', mode = 'n' },
                    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
                    ['gs'] = { 'actions.change_sort', mode = 'n' },
                    -- ['gt'] = { "actions.toggle_trash", mode = "n" },
                    ['-'] = { 'actions.parent', mode = 'n' },
                    ['_'] = { 'actions.open_cwd', mode = 'n' },
                    ['~'] = { 'actions.cd', mode = 'n' },
                    ['<CR>'] = { 'actions.select', mode = 'n' },
                    ['<C-p>'] = { 'actions.preview', mode = 'n', opts = { vertical = true } },
                    ['<C-l>'] = { 'actions.refresh', mode = 'n' },
                    ['<C-j>'] = { 'actions.select', mode = 'n', opts = { vertical = true } },
                },
                view_options = {
                    show_hidden = true,
                },
            })
            vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>')
        end,
    }
}
