-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = {
            {
                'nvim-lua/plenary.nvim',
                'debugloop/telescope-undo.nvim',
            }
        }
    }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    -- use('lukas-reineke/indent-blankline.nvim')
    use{'lukas-reineke/indent-blankline.nvim', tag = "v2.20.8"}
    use({'rose-pine/neovim', as = 'rose-pine',})
    use('numToStr/Comment.nvim')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    --use('lewis6991/satellite.nvim') --only supported for 0.10 above
    use { 'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons',}, }

    use({
        "kylechui/nvim-surround", tag = "*",
        config = function()
            require("nvim-surround").setup({ })
        end
    })

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use ({"akinsho/toggleterm.nvim", tag = '*', event = 'ColorScheme',
    config = function()
        local highlights = require('rose-pine.plugins.toggleterm')
        require("toggleterm").setup({ highlights = highlights })
    end})

end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}})
