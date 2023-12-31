local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
vim.keymap.set('n', '<leader>si', function()
    builtin.grep_string({search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>sw', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>sr', builtin.lsp_references, {})

-- telescope-undo
require('telescope').load_extension('undo')
vim.keymap.set('n', '<leader>su', '<cmd>Telescope undo<CR>', {})

require('telescope').setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                height = 0.9,
                preview_cutoff = 120,
                prompt_position = "bottom",
                width = 0.9,
                preview_width = 0.5
            },
            vertical = {
                height = 0.9,
                preview_cutoff = 0,
                prompt_position = "bottom",
                width = 0.9,
                preview_height = 0.5
            }
        }
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            mappings = {
                n = {
                    ['<leader>bd'] = 'delete_buffer',
                }
            }
        },
        lsp_document_symbols = {
            layout_strategy = 'vertical',
        },
        lsp_workspace_symbols = {
            layout_strategy = 'vertical',
        },
        lsp_references = {
            layout_strategy = 'cursor',
            initial_mode = 'normal',
        },
    },
}
