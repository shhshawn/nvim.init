-- vim.opt.list = true
require('indent_blankline').setup {
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
    show_current_context_start_on_current_line = false,
}

-- set colorscheme (for some reason need to run this command again)
vim.cmd('colorscheme rose-pine')
