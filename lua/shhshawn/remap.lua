vim.g.mapleader = " "
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "<leader>w", "<C-w>")
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>ff", "za")
vim.keymap.set("n", "<leader>fo", "zR")
vim.keymap.set("n", "<leader>fc", "zM")
vim.keymap.set("n", "<leader>fj", "zj")
vim.keymap.set("n", "<leader>fk", "zk")

vim.keymap.set("n", "gp", "`[v`]")
vim.keymap.set({"n", "v"}, "x", [["_x]])
vim.keymap.set("x", "<M-p>", [["_dP]])
vim.keymap.set("n", "<M-p>", [["0p]])
vim.keymap.set("n", "<M-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<M-r>", [[:s/\(.*\)]])
vim.keymap.set("n", "<M-f>", "*Nzz")
vim.keymap.set("v", "<M-f>", [["0y/\V<C-r>=escape(@0,'/\')<CR>\C<CR>Nzz]])
-- vim.keymap.set("v", "<M-f>", [["0y/\V<C-r>0\C<CR>Nzz]])

vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")

vim.keymap.set({"i", "x"}, "<M-i>", "<Esc>")
vim.keymap.set("i" , "<M-h>", "<Home>")
vim.keymap.set("i" , "<M-l>", "<End>")
vim.keymap.set("i" , "<M-J>", "<Down>")
vim.keymap.set("i" , "<M-K>", "<Up>")
vim.keymap.set("i" , "<M-H>", "<Left>")
vim.keymap.set("i" , "<M-L>", "<Right>")
vim.keymap.set({"n", "v"}, "<M-h>", "_")
vim.keymap.set({"n", "v"}, "<M-l>", "$")
vim.keymap.set({"n", "v"}, "<M-m>", "%")

vim.keymap.set("i", "<S-Left>", "<Esc><Left>v")
vim.keymap.set("i", "<S-Right>", "<Esc><Right>v")
vim.keymap.set({"n", "v", "i"}, "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-N>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-o>", "<C-^>")
vim.keymap.set("n", "<M-H>", ":tabp<CR>")
vim.keymap.set("n", "<M-L>", ":tabn<CR>")
vim.keymap.set("n", "<M-J>", ":bn<CR>")
vim.keymap.set("n", "<M-K>", ":bp<CR>")
vim.keymap.set("n", "<M-PageUp>", ":bp<CR>")
vim.keymap.set("n", "<M-PageDown>", ":bn<CR>")
vim.keymap.set("n", "<M-S-PageUp>", ":tabm -1<CR>")
vim.keymap.set("n", "<M-S-PageDown>", ":tabm +1<CR>")

-- vim.keymap.set("c", "<C-j>", [[wildmenumode() ? "\<Down>\<Tab>" : "\<c-j>"]])


-- lsp keybind
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>li", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>ln", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>lp", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.setloclist() end, opts)
        vim.keymap.set("n", "<leader>lq", function() vim.diagnostic.setqflist() end, opts)
        vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set({ "n", "x" }, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
        -- vim.keymap.set({ "n", "x" }, "=", function() vim.lsp.buf.format({ async = true }) end, opts)

        -- lsp-signature
        --[[ local bufnr = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if vim.tbl_contains({ 'null-ls' }, client.name) then  -- blacklist lsp
            return
        end
        require("lsp_signature").on_attach({
            hint_enable = false,
        }, bufnr) ]]
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    float = {
        border = 'rounded',
        source = 'always',
    },
    sign = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)

