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
vim.keymap.set("n", "x", [["_x]])
vim.keymap.set("v", "x", [["_x]])
vim.keymap.set("x", "<M-p>", [["_dP]])
vim.keymap.set("n", "<M-p>", [["0p]])
vim.keymap.set("n", "<M-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<M-f>", "*N")
vim.keymap.set("v", "<M-f>", [["0y/\V<C-r>0\C<CR>N]])

vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")

vim.keymap.set("i" , "<M-q>", "<Esc>")
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

vim.keymap.set("n", "<M-H>", ":tabp<CR>")
vim.keymap.set("n", "<M-L>", ":tabn<CR>")
vim.keymap.set("n", "<M-J>", ":bn<CR>")
vim.keymap.set("n", "<M-K>", ":bp<CR>")
vim.keymap.set("n", "<C-PageUp>", ":tabp<CR>")
vim.keymap.set("n", "<C-PageDown>", ":tabn<CR>")
