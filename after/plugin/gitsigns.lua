require('gitsigns').setup {
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>gd', ':Gitsigns diffthis<CR><C-w>h')
        map('n', '<leader>gl', gs.preview_hunk)
        map('n', '<leader>gn', gs.next_hunk)
        map('n', '<leader>gp', gs.prev_hunk)
        map('n', '<leader>gj', gs.next_hunk)
        map('n', '<leader>gk', gs.prev_hunk)
    end
}
