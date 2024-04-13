return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`

            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- navigation
                --[[ map('n', '<leader>gn', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end) ]]

                --[[ map('n', '<leader>gp', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end) ]]

                -- action
                map('n', '<leader>gd', ':Gitsigns diffthis<CR><C-w>h')
                map('n', '<leader>gl', gitsigns.preview_hunk)
                map('n', '<leader>gn', gitsigns.next_hunk)
                map('n', '<leader>gp', gitsigns.prev_hunk)
                map('n', '<leader>gj', gitsigns.next_hunk)
                map('n', '<leader>gk', gitsigns.prev_hunk)
                -- map({'o', 'x'}, '<leader>gv', ':<C-U>Gitsigns select_hunk<CR>')
                -- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
            end
        }
    end,
}
