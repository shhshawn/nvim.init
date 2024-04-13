return {
    'akinsho/toggleterm.nvim',
    version = '*',
    event = 'colorScheme',
    config = function()
        local highlights = require('rose-pine.plugins.toggleterm')
        require("toggleterm").setup({ highlights = highlights })

        vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>')

        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.9),
                -- height = math.floor(vim.o.lines * 0.8),
            },
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    end,
}
