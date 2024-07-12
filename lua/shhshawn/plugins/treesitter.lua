return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup ({
                -- A list of parser names, or "all" (the four listed parsers should always be installed)
                -- ensure_installed = { "javascript", "typescript", "c", "lua", "vim" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                -- sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,

                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            vim.cmd("set syntax=off")
                            vim.cmd("set syntax=clear")
                            return true
                        end
                    end,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },

                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,

                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["as"] = "@class.outer",
                            ["is"] = "@class.inner",
                            ["ac"] = "@comment.outer",
                            ["ic"] = "@comment.inner",
                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                            ["ai"] = "@conditional.outer",
                            ["ii"] = "@conditional.inner",
                            ["aa"] = "@assignment.outer",
                            ["ia"] = "@assignment.inner",
                            ["ad"] = "@block.outer",
                            ["id"] = "@block.inner",
                            -- You can also use captures from other query groups like `locals.scm`
                            -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            -- linewise
                            ['@function.outer'] = 'V',
                            ['@class.outer'] = 'V',
                            ['@comment.outer'] = 'V',
                            ['@loop.outer'] = 'V',
                            ['@conditional.outer'] = 'V',
                            -- ['@parameter.outer'] = 'v', -- charwise
                            -- ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true of false
                        include_surrounding_whitespace = false,
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]s"] = "@class.outer",
                            ["]c"] = "@comment.outer",
                            ["]a"] = "@assignment.outer",
                            ["]d"] = "@block.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]S"] = "@class.outer",
                            ["]C"] = "@comment.outer",
                            ["]A"] = "@assignment.outer",
                            ["]D"] = "@block.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[s"] = "@class.outer",
                            ["[c"] = "@comment.outer",
                            ["[a"] = "@assignment.outer",
                            ["[d"] = "@block.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[S"] = "@class.outer",
                            ["[C"] = "@comment.outer",
                            ["[A"] = "@assignment.outer",
                            ["[D"] = "@block.outer",
                        },
                        goto_next = {
                            -- ["]a"] = "@block.outer",
                            -- ["]f"] = "@function.outer",
                        },
                        goto_previous = {
                            -- ["[a"] = "@block.outer",
                            -- ["[f"] = "@function.outer",
                        }
                    }
                },
            })

            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
            vim.opt.foldenable = false
            vim.opt.foldlevelstart = 99
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            vim.cmd [[highlight TreesitterContextLineNumber guifg=#9ccfd8]]
            vim.cmd [[highlight TreesitterContextBottom guibg=#26233a gui=underline guisp=Grey]]
            vim.cmd [[highlight TreesitterContext guibg=#26233a]]
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },
}

