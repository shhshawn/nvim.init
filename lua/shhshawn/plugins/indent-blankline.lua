return {
    'lukas-reineke/indent-blankline.nvim',
    -- tag = 'v2.20.8',
    main = 'ibl',
    opts = {},
    config = function ()
        require('ibl').setup {
            indent = {
                char = '▏'
            },
            whitespace = {
                remove_blankline_trail = true
            },
            scope = {
                enabled = true,
                show_start = true,
                show_end = false,
                include = {
                    node_type = {
                        ['*'] = {
                            'return_statement',
                            'table_constructor',
                            'if_statement',
                            'for_statement',
                        }
                    },
                },
            }
        }
    end,
    --[[ config = function()
        require('indent_blankline').setup {
            show_trailing_blankline_indent = true,
            show_current_context = true,
            show_current_context_start = true,
            show_current_context_start_on_current_line = false,
        }

        -- set colorscheme (for some reason need to run this command again)
        -- vim.cmd('colorscheme rose-pine')
    end, ]]
}
