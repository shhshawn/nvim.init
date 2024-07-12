return {
    {
        'tpope/vim-fugitive'
    },
    {
        'folke/trouble.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = 'Trouble',
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                '<leader>lt',
                '<cmd>Trouble diagnostics toggle<CR>',
                desc = 'Diagnostics (Trouble)'
            },
            {
                '<leader>ll',
                '<cmd>Trouble qflist toggle<CR>',
                desc = 'Quickfix List (Trouble)'
            }
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
}
