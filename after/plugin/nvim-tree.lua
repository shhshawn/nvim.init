require('nvim-tree').setup({ })

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
