-- vim.opt.list = true
require('indent_blankline').setup {
    show_trailing_blankline_indent = true,
    show_current_context = true,
    show_current_context_start = true,
    show_current_context_start_on_current_line = false,
}

-- set colorscheme (for some reason need to run this command again)
vim.cmd('colorscheme rose-pine')

-- local highlight = { "indentBlue" }
--
-- local hooks = require "ibl.hooks"
--
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "indentBlue", { fg = "#9CCFD8" })
-- end)
--
-- require("ibl").setup {
--     indent= {
--         -- char = "▏",
--         char = "│",
--         smart_indent_cap = true,
--     },
--     whitespace = {
--         remove_blankline_trail = false,
--     },
--     scope = {
--         enabled = true,
--         show_start = true,
--         show_end = false,
--         injected_languages = true,
--         -- highlight = {"Function", "Label", "Statement", "Conditional", "Repeat", "Exception" },
--         highlight = highlight,
--         include = {
--             -- node_type = { ["*"] = { "*" } },
--             node_type = {
--                 lua = { "return_statement", "table_constructor" },
--                 python = {"if_statement", "try_statement", "for_statement"},
--             },
--         },
--         show_exact_scope = false,
--     },
-- }

