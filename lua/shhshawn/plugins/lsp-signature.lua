return {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
        hint_enable = false,
        always_trigger = true,
    },
    config = function(_, opts)
        require 'lsp_signature'.setup(opts)
    end,
}
